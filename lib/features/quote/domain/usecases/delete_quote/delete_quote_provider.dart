import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';

final deleteQuoteUseCaseProvider = Provider<DeleteQuote>((ref) {
  final repository = ref.watch(quoteRepositoryProvider);
  return DeleteQuote(repository);
});
