import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/auth/domain/domain.dart';

final googleSignInUseCaseProvider = Provider<GoogleSignInUseCase>((ref) {
  final authRepository = ref.watch(authRepositorProvider);
  return GoogleSignInUseCase(authRepository);
});
