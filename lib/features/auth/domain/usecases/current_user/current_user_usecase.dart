import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/auth/auth.dart';
import 'package:quote_generator/features/shared/shared.dart';

class GetCurrentUserUseCase implements UseCase<AppUser?, NoParams> {
  final AuthRepository _repository;

  GetCurrentUserUseCase(this._repository);

  @override
  Future<Either<Failure, AppUser?>> call(NoParams params) async {
    return await _repository.getCurrentUser();
  }
}
