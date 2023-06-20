import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';

final getQuoteByIdProvider =
    StateNotifierProvider<GetQuoteByIdNotifier, QuoteState>((ref) {
  final usecase = ref.read(getQuoteByIdUseCaseProvider);
  return GetQuoteByIdNotifier(usecase);
});
