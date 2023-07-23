import 'package:quote_generator/features/profile/profile.dart';

abstract class UserProfileRemoteDataSource {
  Future<AppUser?> getCurrentUser();
}
