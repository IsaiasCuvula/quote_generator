import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

final deleteQuoteProvider =
    StateNotifierProvider<DeleteQuoteNotifier, QuoteState>((ref) {
  final usecase = ref.read(deleteQuoteUseCaseProvider);
  return DeleteQuoteNotifier(usecase, ref);
});
