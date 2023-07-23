import 'package:dartz/dartz.dart';
import 'package:quote_generator/core/core.dart';
import 'package:quote_generator/features/profile/profile.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, AppUser?>> getCurrentUser();
}
