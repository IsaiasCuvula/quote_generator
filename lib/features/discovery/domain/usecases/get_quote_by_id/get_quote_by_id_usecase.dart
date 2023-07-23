import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/core/core.dart';

class GetRemoteQuoteById implements StreamUseCase<RemoteQuote, String> {
  final RemoteQuoteRepository _repository;
  GetRemoteQuoteById(this._repository);

  @override
  Stream<Either<Failure, RemoteQuote>> call(String quoteId) async* {
    yield* _repository.getRemoteQuoteById(quoteId);
  }
}
