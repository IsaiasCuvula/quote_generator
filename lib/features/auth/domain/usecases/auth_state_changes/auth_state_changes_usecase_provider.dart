import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/auth/domain/domain.dart';

final authStateChangesUseCaseProvider = Provider<AuthStateChangesUseCase>(
  (ref) {
    final authRepository = ref.watch(authRepositorProvider);
    return AuthStateChangesUseCase(authRepository);
  },
);
