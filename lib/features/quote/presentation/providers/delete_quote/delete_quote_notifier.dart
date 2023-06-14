import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

class DeleteQuoteNotifier extends StateNotifier<QuoteState> {
  DeleteQuoteNotifier(this._deleteQuote, this._ref)
      : super(const QuoteState.initial());

  final DeleteQuote _deleteQuote;
  final Ref _ref;

  Future<void> deleteQuote(int id) async {
    state = state.copyWith(isLoading: true);
    final result = await _deleteQuote(id);
    state = result.fold(
      (failure) => state.copyWith(
        message: failure.message,
        isLoading: false,
      ),
      (success) => state.copyWith(
        isLoading: false,
      ),
    );
    await _ref.read(getQuotesProvider.notifier).getQuotes();
  }
}
