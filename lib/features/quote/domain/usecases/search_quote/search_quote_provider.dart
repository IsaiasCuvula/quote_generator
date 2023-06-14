import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';

final searchQuoteUseCaseProvider = Provider<SearchQuote>((ref) {
  final repository = ref.read(quoteRepositoryProvider);
  return SearchQuote(repository);
});
