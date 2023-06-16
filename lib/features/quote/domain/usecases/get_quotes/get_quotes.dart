import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

class GetQuotes implements UseCase<QuoteList, NoParams> {
  final QuoteRepository _repository;
  GetQuotes(this._repository);

  @override
  Future<Either<Failure, QuoteList>> call(NoParams params) async {
    return await _repository.getQuotes();
  }
}
