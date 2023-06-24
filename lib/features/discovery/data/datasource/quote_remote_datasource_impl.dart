import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quote_generator/features/discovery/data/data.dart';
import 'package:quote_generator/features/shared/shared.dart';

class QuoteRemoteDatasourceImpl implements QuoteRemoteDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> postQuote(RemoteQuoteModel quote) async {
    final result = await _quotesCollectionRef().add(quote.toJson());
    await _quotesCollectionRef()
        .doc(result.id)
        .update({FirebaseFieldName.quoteId: result.id});
  }

  @override
  Stream<QuerySnapshot<Object?>> getAllQuotes() async* {
    yield* _quotesCollectionRef()
        .orderBy(
          FirebaseFieldName.createdAt,
          descending: true,
        )
        .snapshots();
  }

  @override
  Future<void> likeDislike(String quoteId, String userId) async {
    final quoteRef = _quotesCollectionRef().doc(quoteId);
    final quoteSnapshot = await quoteRef.get();
    if (quoteSnapshot.exists) {
      final quote = quoteSnapshot.data() as Map<String, dynamic>;
      if (quote.isNotEmpty) {
        final likes = quote[FirebaseFieldName.likes] ?? [];
        final isLiked = likes?.contains(userId);
        if (isLiked) {
          await _quotesCollectionRef().doc(quoteId).update({
            FirebaseFieldName.likes: FieldValue.arrayRemove([userId]),
          });
        } else {
          await _quotesCollectionRef().doc(quoteId).update({
            FirebaseFieldName.likes: FieldValue.arrayUnion([userId]),
          });
        }
      }
    }
  }

  @override
  Stream<DocumentSnapshot<Object?>> hasLiked(
      String quoteId, String userId) async* {
    yield* _quotesCollectionRef().doc(quoteId).snapshots();
  }

  @override
  Stream<DocumentSnapshot<Object?>> likesCount(String quoteId) async* {
    yield* _quotesCollectionRef().doc(quoteId).snapshots();
  }

  @override
  Stream<QuerySnapshot<Object?>> getRemoteQuoteById(String quoteId) async* {
    yield* _quotesCollectionRef()
        .where(
          FieldPath.documentId,
          isEqualTo: quoteId,
        )
        .limit(1)
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<Object?>> getUserInfo(String userId) async* {
    yield* _usersCollectionRef()
        .where(
          FirebaseFieldName.userId,
          isEqualTo: userId,
        )
        .limit(1)
        .snapshots();
  }

  @override
  Future<void> delete(RemoteQuoteModel quote) async {
    final query = _quotesCollectionRef()
        .where(
          FieldPath.documentId,
          isEqualTo: quote.quoteId,
        )
        .where(
          FirebaseFieldName.userId,
          isEqualTo: quote.userId,
        )
        .limit(1)
        .get();
    await query.then((snapshot) async {
      for (final doc in snapshot.docs) {
        await doc.reference.delete();
      }
    });
  }

  CollectionReference _quotesCollectionRef() {
    return _firestore.collection(
      FirebaseCollectionName.quotes,
    );
  }

  CollectionReference _usersCollectionRef() {
    return _firestore.collection(
      FirebaseCollectionName.users,
    );
  }
}
