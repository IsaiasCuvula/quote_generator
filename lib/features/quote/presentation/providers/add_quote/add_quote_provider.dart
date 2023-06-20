import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';

final addQuoteProvider =
    StateNotifierProvider<AddQuoteNotifier, QuoteState>((ref) {
  final usecase = ref.read(addQuoteUseCaseProvider);
  return AddQuoteNotifier(usecase, ref);
});
