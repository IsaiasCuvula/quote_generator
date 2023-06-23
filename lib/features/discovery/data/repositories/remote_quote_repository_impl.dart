import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/shared/errors/failure.dart';
import 'package:quote_generator/features/user_profile/domain/entities/app_user.dart';

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
              .map(
                (doc) => RemoteQuoteMapper.toRemoteQuoteEntity(
                  RemoteQuoteModel.fromJson(doc.data() as Map<String, dynamic>),
                ),
              )
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
  Stream<Either<Failure, bool>> hasFavoritedPost(
      String quoteId, String userId) async* {
    try {
      final result = _datasource.hasFavoritedPost(quoteId, userId);
      yield* result.map(
        (snapshot) {
          if (snapshot.docs.isNotEmpty) {
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
  Stream<Either<Failure, int>> quoteFavoritesCount(String quoteId) async* {
    try {
      final result = _datasource.quoteFavoritesCount(quoteId);
      yield* result.map(
        (snapshot) {
          return Right(snapshot.docs.length);
        },
      );
    } catch (e) {
      const Left(Failure("Oops, something went wrong"));
    }
  }

  @override
  Future<Either<Failure, bool>> favoriteAndUnfavoriteQuote(
      RemoteQuote quote) async {
    try {
      final quoteModel = RemoteQuoteMapper.toRemoteQuoteModel(quote);
      final result = await _datasource.favoriteAndUnfavoriteQuote(quoteModel);
      return Right(result);
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
            RemoteQuoteModel.fromJson(doc.data() as Map<String, dynamic>),
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
