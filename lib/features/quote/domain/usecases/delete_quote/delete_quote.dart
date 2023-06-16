import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

class DeleteQuote implements UseCase<int, int> {
  final QuoteRepository _repository;

  DeleteQuote(this._repository);

  @override
  Future<Either<Failure, int>> call(int params) async {
    return await _repository.deleteQuote(params);
  }
}
