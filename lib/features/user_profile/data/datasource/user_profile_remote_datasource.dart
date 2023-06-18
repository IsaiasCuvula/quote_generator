import 'package:quote_generator/features/user_profile/user_profile.dart';

abstract class UserProfileRemoteDataSource {
  Future<AppUser?> getCurrentUser();
}
