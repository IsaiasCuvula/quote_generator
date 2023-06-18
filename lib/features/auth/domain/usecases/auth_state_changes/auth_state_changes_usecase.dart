import 'package:firebase_auth/firebase_auth.dart';
import 'package:quote_generator/features/auth/auth.dart';

class AuthStateChangesUseCase {
  final AuthRepository _repository;

  AuthStateChangesUseCase(this._repository);

  Stream<User?> call() {
    return _repository.authStateChanges();
  }
}
