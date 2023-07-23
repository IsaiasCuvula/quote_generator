import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/core/core.dart';

class HasLikedQuote implements StreamUseCase<bool, MapString> {
  final RemoteQuoteRepository _repository;
  HasLikedQuote(this._repository);

  @override
  Stream<Either<Failure, bool>> call(MapString info) async* {
    final quoteId = '${info[QuoteKey.quoteId]}';
    final userId = '${info[QuoteKey.userId]}';
    yield* _repository.hasLikedQuote(quoteId, userId);
  }
}
