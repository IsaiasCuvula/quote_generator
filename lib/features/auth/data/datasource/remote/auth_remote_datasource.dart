import 'package:firebase_auth/firebase_auth.dart';
import 'package:quote_generator/features/auth/auth.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResult> googleSignIn();
  Future<void> googleSignOut();
  Stream<User?> authStateChanges();
  Future<AppUser?> getCurrentUser();
}
