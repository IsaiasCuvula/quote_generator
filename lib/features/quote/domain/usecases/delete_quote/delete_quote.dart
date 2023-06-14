import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

class DeleteQuote implements UseCase<int, int> {
  final QuoteRepository repository;

  DeleteQuote(this.repository);

  @override
  Future<Either<Failure, int>> call(int params) async {
    return await repository.deleteQuote(params);
  }
}
