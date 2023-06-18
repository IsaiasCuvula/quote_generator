import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/auth/auth.dart';
import 'package:quote_generator/features/shared/shared.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final GoogleSignInUseCase _googleSignInUseCase;
  final SignOutUseCase _signOut;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  AuthNotifier(
    this._googleSignInUseCase,
    this._signOut,
    this._getCurrentUserUseCase,
  ) : super(const AuthState.initial()) {
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    state.copyWith(isLoading: true);
    final result = await _getCurrentUserUseCase(NoParams());
    state = result.fold(
      (failure) => state.copyWith(
        isLoading: false,
        authResult: AuthResult.failure,
      ),
      (appUser) {
        return state.copyWith(
          authResult: AuthResult.success,
          isLoading: false,
          appUser: appUser,
        );
      },
    );
  }

  Future<void> googleSignIn() async {
    state.copyWith(isLoading: true);
    final result = await _googleSignInUseCase(NoParams());
    state = result.fold(
      (failure) => state.copyWith(
        isLoading: false,
        authResult: AuthResult.failure,
      ),
      (authResult) {
        return state.copyWith(
          authResult: authResult,
          isLoading: false,
        );
      },
    );
  }

  Future<void> signOut() async {
    state.copyWith(isLoading: true);
    await _signOut().then((value) {
      state = state.copyWith(
        authResult: AuthResult.none,
        isLoading: false,
        appUser: null,
      );
    });
  }
}
