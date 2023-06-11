import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

class UpdateQuote implements UseCase<int, Quote> {
  final QuoteRepository repository;

  UpdateQuote(this.repository);

  @override
  Future<Either<Failure, int>> call(Quote params) async {
    return await repository.updateQuote(params);
  }
}
