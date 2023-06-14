import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

class AddQuote implements UseCase<int, Quote> {
  final QuoteRepository repository;

  AddQuote(this.repository);

  @override
  Future<Either<Failure, int>> call(Quote params) async {
    return await repository.addQuote(params);
  }
}
