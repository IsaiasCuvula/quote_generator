import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/core/core.dart';

class DeleteRemoteQuote implements UseCase<bool, RemoteQuote> {
  final RemoteQuoteRepository _repository;
  DeleteRemoteQuote(this._repository);

  @override
  Future<Either<Failure, bool>> call(RemoteQuote quote) async {
    return await _repository.delete(quote);
  }
}
