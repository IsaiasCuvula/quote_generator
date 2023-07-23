import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/core/core.dart';
import 'package:quote_generator/features/profile/domain/usecases/current_user/current_user.dart';
import 'package:quote_generator/features/profile/presentation/presentation.dart';

class UserProfileNotifier extends StateNotifier<UserProfileState> {
  final UserProfileUseCase _getCurrentUserUseCase;

  UserProfileNotifier(
    this._getCurrentUserUseCase,
  ) : super(const UserProfileState.initial()) {
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    state.copyWith(isLoading: true);
    final result = await _getCurrentUserUseCase(NoParams());
    state = result.fold(
      (failure) => state.copyWith(isLoading: false),
      (appUser) {
        return state.copyWith(
          isLoading: false,
          appUser: appUser,
        );
      },
    );
  }
}
