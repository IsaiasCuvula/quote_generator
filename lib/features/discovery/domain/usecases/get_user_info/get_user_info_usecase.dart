import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/shared/shared.dart';
import 'package:quote_generator/features/user_profile/domain/domain.dart';

class GetUserInfo implements StreamUseCase<AppUser, String> {
  final RemoteQuoteRepository _repository;
  GetUserInfo(this._repository);

  @override
  Stream<Either<Failure, AppUser>> call(String userId) async* {
    yield* _repository.getUserInfo(userId);
  }
}
