import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';

final quoteProvider = StateNotifierProvider<QuoteNotifier, QuoteState>((ref) {
  final quoteRepository = ref.read(quoteRepositoryProvider);
  return QuoteNotifier(quoteRepository, ref);
});
