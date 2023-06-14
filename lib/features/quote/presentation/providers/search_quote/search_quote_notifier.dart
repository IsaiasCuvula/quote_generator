import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

class SearchQuoteNotifier extends StateNotifier<QuoteState> {
  SearchQuoteNotifier(this._searchQuote) : super(const QuoteState.initial());

  final SearchQuote _searchQuote;

  Future<void> searchQuote(String query) async {
    state = state.copyWith(isLoading: true);
    final result = await _searchQuote(query);
    state = result.fold(
      (failure) => state.copyWith(
        message: failure.message,
        isLoading: false,
      ),
      (newSearcherdQuotes) => state.copyWith(
        isLoading: false,
        searcherdQuotes: newSearcherdQuotes,
      ),
    );
  }

  void clearSearchedQuotesEvent() async {
    state = state.copyWith(searcherdQuotes: []);
  }
}
