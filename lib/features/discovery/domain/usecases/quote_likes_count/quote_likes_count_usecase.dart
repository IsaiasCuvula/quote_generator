import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/core/core.dart';

class QuoteLikesCount implements StreamUseCase<int, String> {
  final RemoteQuoteRepository _repository;
  QuoteLikesCount(this._repository);

  @override
  Stream<Either<Failure, int>> call(String quoteId) async* {
    yield* _repository.quoteLikesCount(quoteId);
  }
}
