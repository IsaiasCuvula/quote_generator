import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/shared/shared.dart';

class GetAllQuotes implements StreamUseCase<RemoteQuoteList, NoParams> {
  final RemoteQuoteRepository _repository;
  GetAllQuotes(this._repository);

  @override
  Stream<Either<Failure, RemoteQuoteList>> call(NoParams noParams) async* {
    yield* _repository.getAllQuotes();
  }
}
