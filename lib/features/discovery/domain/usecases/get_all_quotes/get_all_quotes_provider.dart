import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/discovery.dart';

final getAllQuotesUseCaseProvider = Provider<GetAllQuotes>((ref) {
  final repository = ref.watch(remoteQuoteRepositoryProvider);
  return GetAllQuotes(repository);
});
