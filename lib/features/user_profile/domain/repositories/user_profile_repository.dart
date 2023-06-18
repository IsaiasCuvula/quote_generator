import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/shared/shared.dart';
import 'package:quote_generator/features/user_profile/user_profile.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, AppUser?>> getCurrentUser();
}
