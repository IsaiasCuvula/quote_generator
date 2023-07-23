import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/core/core.dart';

class PostQuote implements UseCase<bool, RemoteQuote> {
  final RemoteQuoteRepository _repository;
  PostQuote(this._repository);

  @override
  Future<Either<Failure, bool>> call(RemoteQuote quote) async {
    return await _repository.postQuote(quote);
  }
}
