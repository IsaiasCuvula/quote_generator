import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';

final updateQuoteUseCaseProvider = Provider<UpdateQuote>((ref) {
  final repository = ref.read(quoteRepositoryProvider);
  return UpdateQuote(repository);
});
