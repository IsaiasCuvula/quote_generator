import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';

final addQuoteUseCaseProvider = Provider<AddQuote>((ref) {
  final repository = ref.read(quoteRepositoryProvider);
  return AddQuote(repository);
});
