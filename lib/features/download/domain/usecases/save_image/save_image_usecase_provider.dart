import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/download/download.dart';

final saveImageUseCaseProvider = Provider<SaveImageUseCase>((ref) {
  final repository = ref.read(downloadRepositoryProvider);
  return SaveImageUseCase(repository);
});
