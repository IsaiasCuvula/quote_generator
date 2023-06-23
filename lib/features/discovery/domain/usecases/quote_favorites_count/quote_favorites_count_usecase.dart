import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/shared/shared.dart';

class QuoteFavoritesCount implements StreamUseCase<int, String> {
  final RemoteQuoteRepository _repository;
  QuoteFavoritesCount(this._repository);

  @override
  Stream<Either<Failure, int>> call(String quoteId) async* {
    yield* _repository.quoteFavoritesCount(quoteId);
  }
}
