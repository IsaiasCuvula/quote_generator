import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/discovery.dart';

final deleteRemoteQuoteUseCaseProvider = Provider<DeleteQuote>((ref) {
  final repository = ref.watch(remoteQuoteRepositoryProvider);
  return DeleteQuote(repository);
});
