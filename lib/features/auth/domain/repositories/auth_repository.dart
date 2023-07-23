import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quote_generator/core/core.dart';
import 'package:quote_generator/features/auth/auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResult>> signIn();
  Future<void> signOut();
  Stream<User?> authStateChanges();
}
