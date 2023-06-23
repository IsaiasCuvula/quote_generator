import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quote_generator/features/discovery/discovery.dart';

abstract class QuoteRemoteDatasource {
  Stream<QuerySnapshot<Object?>> getAllQuotes();
  Future<void> postQuote(RemoteQuoteModel quote);
  Future<bool> favoriteAndUnfavoriteQuote(RemoteQuoteModel quote);
  Stream<QuerySnapshot<Object?>> getRemoteQuoteById(String quoteId);
  Stream<QuerySnapshot<Object?>> quoteFavoritesCount(String quoteId);
  Stream<QuerySnapshot<Object?>> hasFavoritedPost(
    String quoteId,
    String userId,
  );
  Stream<QuerySnapshot<Object?>> getUserInfo(String userId);
  Future<void> delete(RemoteQuoteModel quote);
}
