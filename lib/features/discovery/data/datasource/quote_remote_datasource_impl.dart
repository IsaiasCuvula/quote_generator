import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quote_generator/features/discovery/data/data.dart';
import 'package:quote_generator/features/shared/shared.dart';

class QuoteRemoteDatasourceImpl implements QuoteRemoteDatasource {
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
  Future<bool> favoriteAndUnfavoriteQuote(RemoteQuoteModel quote) async {
    final query = _favoritesCollectionRef()
        .where(
          FirebaseFieldName.quoteId,
          isEqualTo: quote.quoteId,
        )
        .where(
          FirebaseFieldName.userId,
          isEqualTo: quote.userId,
        )
        .get();

    bool hasFavorite = await query.then(
      (snapshot) => snapshot.docs.isNotEmpty,
    );
    if (hasFavorite) {
      //remove favorite
      try {
        await query.then((snapshot) async {
          for (final doc in snapshot.docs) {
            await doc.reference.delete();
          }
        });
        return true;
      } catch (_) {
        return false;
      }
    } else {
      try {
        await _favoritesCollectionRef().add(quote.toJson());
        return true;
      } catch (e) {
        return false;
      }
    }
  }

  @override
  Stream<QuerySnapshot<Object?>> hasFavoritedPost(
      String quoteId, String userId) async* {
    yield* _favoritesCollectionRef()
        .where(
          FirebaseFieldName.quoteId,
          isEqualTo: quoteId,
        )
        .where(
          FirebaseFieldName.userId,
          isEqualTo: userId,
        )
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<Object?>> quoteFavoritesCount(String quoteId) async* {
    yield* _favoritesCollectionRef()
        .where(
          FirebaseFieldName.quoteId,
          isEqualTo: quoteId,
        )
        .snapshots();
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
    return FirebaseFirestore.instance.collection(
      FirebaseCollectionName.quotes,
    );
  }

  CollectionReference _favoritesCollectionRef() {
    return FirebaseFirestore.instance.collection(
      FirebaseCollectionName.favorites,
    );
  }

  CollectionReference _usersCollectionRef() {
    return FirebaseFirestore.instance.collection(
      FirebaseCollectionName.users,
    );
  }
}
