import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

class SearchQuote implements UseCase<QuoteList, String> {
  final QuoteRepository repository;

  SearchQuote(this.repository);
  @override
  Future<Either<Failure, QuoteList>> call(String params) async {
    return await repository.searchQuote(params);
  }
}
