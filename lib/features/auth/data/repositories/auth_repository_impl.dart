import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quote_generator/features/auth/data/datasource/datasource.dart';
import 'package:quote_generator/features/auth/data/models/auth_result.dart';
import 'package:quote_generator/features/auth/domain/domain.dart';
import 'package:quote_generator/features/shared/errors/failure.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);
  @override
  Stream<User?> authStateChanges() {
    try {
      final result = _authRemoteDataSource.authStateChanges();
      return result;
    } catch (e) {
      throw const Failure('there is no user');
    }
  }

  @override
  Future<Either<Failure, AuthResult>> signIn() async {
    try {
      final result = await _authRemoteDataSource.googleSignIn();
      return Right(result);
    } catch (e) {
      return const Left(Failure('something went wrong'));
    }
  }

  @override
  Future<void> signOut() async {
    return await _authRemoteDataSource.googleSignOut();
  }

  @override
  Future<Either<Failure, AppUser?>> getCurrentUser() async {
    try {
      final result = await _authRemoteDataSource.getCurrentUser();
      return Right(result);
    } catch (e) {
      return const Left(Failure('something went wrong'));
    }
  }
}
