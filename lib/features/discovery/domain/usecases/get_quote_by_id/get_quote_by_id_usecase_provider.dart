import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/discovery.dart';

final getRemoteQuoteByIdUseCaseProvider = Provider<GetRemoteQuoteById>((ref) {
  final repository = ref.watch(remoteQuoteRepositoryProvider);
  return GetRemoteQuoteById(repository);
});
