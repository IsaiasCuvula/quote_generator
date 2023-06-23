import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/shared/shared.dart';

class DeleteQuote implements UseCase<bool, RemoteQuote> {
  final RemoteQuoteRepository _repository;
  DeleteQuote(this._repository);

  @override
  Future<Either<Failure, bool>> call(RemoteQuote quote) async {
    return await _repository.delete(quote);
  }
}
