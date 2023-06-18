import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/auth/auth.dart';
import 'package:quote_generator/features/shared/shared.dart';

class GoogleSignInUseCase implements UseCase<AuthResult, NoParams> {
  final AuthRepository _authRepository;

  GoogleSignInUseCase(this._authRepository);
  @override
  Future<Either<Failure, AuthResult>> call(NoParams params) async {
    return await _authRepository.signIn();
  }
}
