import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/shared/shared.dart';

class FavoritesAndUnfavoriteQuote implements UseCase<bool, RemoteQuote> {
  final RemoteQuoteRepository _repository;
  FavoritesAndUnfavoriteQuote(this._repository);

  @override
  Future<Either<Failure, bool>> call(RemoteQuote quote) async {
    return await _repository.favoriteAndUnfavoriteQuote(quote);
  }
}
