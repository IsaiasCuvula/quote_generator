import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/core/core.dart';

class AddQuote implements UseCase<int, Quote> {
  final QuoteRepository _repository;

  AddQuote(this._repository);

  @override
  Future<Either<Failure, int>> call(Quote params) async {
    return await _repository.addQuote(params);
  }
}
