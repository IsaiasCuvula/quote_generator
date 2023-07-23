import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/core/core.dart';

abstract class QuoteRepository {
  Future<Either<Failure, int>> addQuote(Quote quote);
  Future<Either<Failure, Quote?>> getQuoteById(int id);
  Future<Either<Failure, QuoteList>> getQuotes();
  Future<Either<Failure, int>> updateQuote(Quote quote);
  Future<Either<Failure, int>> deleteQuote(int id);
  Future<Either<Failure, QuoteList>> searchQuote(String query);
}
