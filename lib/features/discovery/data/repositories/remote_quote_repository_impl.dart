import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/core/core.dart';
import 'package:quote_generator/features/profile/domain/entities/app_user.dart';

class RemoteQuoteRepositoryImpl implements RemoteQuoteRepository {
  final QuoteRemoteDatasource _datasource;

  RemoteQuoteRepositoryImpl(this._datasource);

  @override
  Stream<Either<Failure, RemoteQuoteList>> getAllQuotes() async* {
    try {
      final quotesDoc = _datasource.getAllQuotes();
      yield* quotesDoc.map(
        (snapshot) => Right(
          snapshot.docs
              .map((doc) => RemoteQuoteMapper.toRemoteQuoteEntity(
                    RemoteQuoteModel.fromSnapshot(doc),
                  ))
              .toList(),
        ),
      );
    } catch (e) {
      const Left(
        Failure("Oops, something went wrong couldn't fetch quotes"),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> postQuote(RemoteQuote quote) async {
    try {
      final quoteModel = RemoteQuoteMapper.toRemoteQuoteModel(quote);
      await _datasource.postQuote(quoteModel);
      return const Right(true);
    } catch (e) {
      return const Left(Failure('Oops, something went wrong'));
    }
  }

  @override
  Stream<Either<Failure, bool>> hasLikedQuote(
      String quoteId, String userId) async* {
    try {
      final result = _datasource.hasLiked(quoteId, userId);
      yield* result.map(
        (snapshot) {
          final favorites = snapshot.get(FirebaseFieldName.likes);
          if (favorites?.contains(userId)) {
            return const Right(true);
          } else {
            return const Right(false);
          }
        },
      );
    } catch (e) {
      const Left(Failure("Oops, something went wrong"));
    }
  }

  @override
  Stream<Either<Failure, int>> quotelikesCount(String quoteId) async* {
    try {
      final result = _datasource.likesCount(quoteId);
      yield* result.map((snapshot) {
        final likes = snapshot.get(FirebaseFieldName.likes);
        final int total = likes?.length;
        return Right(total);
      });
    } catch (e) {
      const Left(Failure("Oops, something went wrong"));
    }
  }

  @override
  Future<Either<Failure, bool>> likeDislikeQuote(
      String quoteId, String userId) async {
    try {
      await _datasource.likeDislike(quoteId, userId);
      return const Right(true);
    } catch (e) {
      return const Left(Failure("Oops, something went wrong"));
    }
  }

  @override
  Stream<Either<Failure, RemoteQuote>> getRemoteQuoteById(
    String quoteId,
  ) async* {
    try {
      final result = _datasource.getRemoteQuoteById(quoteId);

      yield* result.map((snapshot) {
        final doc = snapshot.docs.first;

        return Right(
          RemoteQuoteMapper.toRemoteQuoteEntity(
            RemoteQuoteModel.fromSnapshot(doc),
          ),
        );
      });
    } catch (e) {
      const Left(Failure("Oops, something went wrong"));
    }
  }

  @override
  Stream<Either<Failure, AppUser>> getUserInfo(String userId) async* {
    try {
      final result = _datasource.getUserInfo(userId);
      yield* result.map((snapshot) {
        final doc = snapshot.docs.first;
        return Right(
          AppUser.fromJson(doc.data() as Map<String, dynamic>),
        );
      });
    } catch (e) {
      const Left(Failure("Oops, something went wrong"));
    }
  }

  @override
  Future<Either<Failure, bool>> delete(RemoteQuote quote) async {
    try {
      final quoteModel = RemoteQuoteMapper.toRemoteQuoteModel(quote);
      await _datasource.delete(quoteModel);
      return const Right(true);
    } catch (e) {
      return const Left(Failure('Oops, something went wrong'));
    }
  }
}
