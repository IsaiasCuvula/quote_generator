import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quote_generator/features/auth/auth.dart';
import 'package:quote_generator/features/shared/shared.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResult>> signIn();
  Future<void> signOut();
  Stream<User?> authStateChanges();
  Future<Either<Failure, AppUser?>> getCurrentUser();
}
