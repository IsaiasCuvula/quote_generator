import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/core/core.dart';
import 'package:quote_generator/features/profile/domain/domain.dart';

class GetUserInfo implements StreamUseCase<AppUser, String> {
  final RemoteQuoteRepository _repository;
  GetUserInfo(this._repository);

  @override
  Stream<Either<Failure, AppUser>> call(String userId) async* {
    yield* _repository.getUserInfo(userId);
  }
}
