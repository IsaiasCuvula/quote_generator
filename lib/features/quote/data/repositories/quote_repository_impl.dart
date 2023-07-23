import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/core/core.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteLocalDatasource _localDatasource;
  QuoteRepositoryImpl(this._localDatasource);

  @override
  Future<Either<Failure, int>> addQuote(Quote quote) async {
    try {
      final results = await _localDatasource.addQuote(
        QuoteMapper.toModel(quote),
      );
      return Right(results);
    } catch (e) {
      return const Left(Failure(ErrorMessage.addQuoteError));
    }
  }

  @override
  Future<Either<Failure, int>> deleteQuote(int id) async {
    try {
      final quoteModelList = await _localDatasource.deleteQuote(id);
      return Right(quoteModelList);
    } catch (e) {
      return const Left(Failure(ErrorMessage.deleteQuoteError));
    }
  }

  @override
  Future<Either<Failure, Quote?>> getQuoteById(int id) async {
    try {
      final quote = await _localDatasource.getQuoteById(id);
      return Right(QuoteMapper.toEntity(quote!));
    } catch (e) {
      return const Left(Failure(ErrorMessage.getQuoteByIdError));
    }
  }

  @override
  Future<Either<Failure, QuoteList>> getQuotes() async {
    try {
      final results = await _localDatasource.getQuotes();
      final quotes = results.map((quoteModel) {
        return QuoteMapper.toEntity(quoteModel);
      }).toList();
      return Right(quotes);
    } catch (e) {
      return const Left(Failure(ErrorMessage.getQuoteError));
    }
  }

  @override
  Future<Either<Failure, int>> updateQuote(Quote quote) async {
    try {
      final result = await _localDatasource.updateQuote(
        QuoteMapper.toModel(quote),
      );
      return Right(result);
    } catch (e) {
      return const Left(Failure(ErrorMessage.updateQuoteError));
    }
  }

  @override
  Future<Either<Failure, QuoteList>> searchQuote(String query) async {
    try {
      final quoteModelList = await _localDatasource.searchQuote(query);
      final quotes = quoteModelList.map((quote) {
        return QuoteMapper.toEntity(quote);
      });
      return Right(quotes.toList());
    } catch (e) {
      return const Left(Failure(ErrorMessage.searchQuoteError));
    }
  }
}
