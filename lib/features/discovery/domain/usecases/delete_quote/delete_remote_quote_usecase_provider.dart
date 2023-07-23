import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/discovery.dart';

final deleteRemoteQuoteUseCaseProvider = Provider<DeleteRemoteQuote>((ref) {
  final repository = ref.watch(remoteQuoteRepositoryProvider);
  return DeleteRemoteQuote(repository);
});
