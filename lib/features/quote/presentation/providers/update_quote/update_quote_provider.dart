import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';

final updateQuoteProvider =
    StateNotifierProvider<UpdateQuoteNotifier, QuoteState>((ref) {
  final usecase = ref.read(updateQuoteUseCaseProvider);
  return UpdateQuoteNotifier(usecase, ref);
});
