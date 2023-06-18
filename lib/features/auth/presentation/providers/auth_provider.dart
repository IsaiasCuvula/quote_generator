import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/auth/auth.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final usecaseSignIn = ref.watch(googleSignInUseCaseProvider);
  final usecaseSignOut = ref.watch(signOutUseCaseProvider);
  final usecaseGetCurrentUser = ref.watch(getCurrentUserUseCaseProvider);
  return AuthNotifier(
    usecaseSignIn,
    usecaseSignOut,
    usecaseGetCurrentUser,
  );
});
