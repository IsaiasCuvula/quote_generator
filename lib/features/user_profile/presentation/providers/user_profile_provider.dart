import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/user_profile/user_profile.dart';

final userProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfileState>((ref) {
  final usecase = ref.watch(userProfileUseCaseProvider);
  return UserProfileNotifier(usecase);
});
