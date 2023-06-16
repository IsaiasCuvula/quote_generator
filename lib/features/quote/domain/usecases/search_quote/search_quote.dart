import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

class SearchQuote implements UseCase<QuoteList, String> {
  final QuoteRepository _repository;

  SearchQuote(this._repository);
  @override
  Future<Either<Failure, QuoteList>> call(String params) async {
    return await _repository.searchQuote(params);
  }
}
