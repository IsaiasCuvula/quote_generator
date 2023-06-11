import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

class AddQuote implements UseCase<Quote, Params> {
  final QuoteRepository repository;

  AddQuote(this.repository);
  @override
  Future<Either<Failure, int>> call(params) async {
    return await repository.addQuote(params);
  }
}
