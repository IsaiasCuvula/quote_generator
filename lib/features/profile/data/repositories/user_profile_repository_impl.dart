import 'package:dartz/dartz.dart';
import 'package:quote_generator/core/core.dart';
import 'package:quote_generator/features/profile/profile.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDataSource _userProfileRemoteDataSource;

  UserProfileRepositoryImpl(this._userProfileRemoteDataSource);

  @override
  Future<Either<Failure, AppUser?>> getCurrentUser() async {
    try {
      final result = await _userProfileRemoteDataSource.getCurrentUser();
      return Right(result);
    } catch (e) {
      return const Left(Failure('something went wrong'));
    }
  }
}
