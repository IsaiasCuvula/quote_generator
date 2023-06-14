import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

final searchQuoteProvider =
    StateNotifierProvider.autoDispose<SearchQuoteNotifier, QuoteState>((ref) {
  final usecase = ref.read(searchQuoteUseCaseProvider);
  return SearchQuoteNotifier(usecase);
});
