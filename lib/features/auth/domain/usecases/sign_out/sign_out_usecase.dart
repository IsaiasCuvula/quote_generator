import 'package:quote_generator/features/auth/auth.dart';

class SignOutUseCase {
  final AuthRepository _repository;
  SignOutUseCase(this._repository);

  Future<void> call() async {
    return await _repository.signOut();
  }
}
