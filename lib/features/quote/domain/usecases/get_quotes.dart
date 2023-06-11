import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

class GetQuotes implements UseCase<QuoteList, NoParams> {
  final QuoteRepository repository;

  GetQuotes(this.repository);
  @override
  Future<Either<Failure, QuoteList>> call(NoParams noParams) async {
    return await repository.getQuotes();
  }
}
