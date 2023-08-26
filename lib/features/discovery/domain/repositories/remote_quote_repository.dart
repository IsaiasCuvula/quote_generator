import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/core/core.dart';
import 'package:quote_generator/features/profile/profile.dart';

abstract class RemoteQuoteRepository {
  Stream<Either<Failure, RemoteQuoteList>> getAllQuotes();
  Future<Either<Failure, bool>> postQuote(RemoteQuote quote);
  Future<Either<Failure, bool>> likeDislikeQuote(String quoteId, String userId);
  Stream<Either<Failure, int>> quoteLikesCount(String quoteId);
  Stream<Either<Failure, bool>> hasLikedQuote(String quoteId, String userId);
  Future<Either<Failure, bool>> delete(RemoteQuote quote);
  Stream<Either<Failure, RemoteQuote>> getRemoteQuoteById(String quoteId);
  Stream<Either<Failure, AppUser>> getUserInfo(String userId);
}
