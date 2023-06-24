import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quote_generator/features/discovery/discovery.dart';

abstract class QuoteRemoteDatasource {
  Stream<QuerySnapshot<Object?>> getAllQuotes();
  Future<void> postQuote(RemoteQuoteModel quote);
  Future<void> likeDislike(String quoteId, String userId);
  Stream<QuerySnapshot<Object?>> getRemoteQuoteById(String quoteId);
  Stream<DocumentSnapshot<Object?>> likesCount(String quoteId);
  Stream<DocumentSnapshot<Object?>> hasLiked(String quoteId, String userId);
  Stream<QuerySnapshot<Object?>> getUserInfo(String userId);
  Future<void> delete(RemoteQuoteModel quote);
}
