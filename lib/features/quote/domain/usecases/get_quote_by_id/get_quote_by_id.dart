import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/errors/failure.dart';
import 'package:quote_generator/features/shared/usecases/usecase.dart';

class GetQuoteById implements UseCase<Quote?, int> {
  final QuoteRepository _repository;

  GetQuoteById(this._repository);
  @override
  Future<Either<Failure, Quote?>> call(int params) async {
    return await _repository.getQuoteById(params);
  }
}
