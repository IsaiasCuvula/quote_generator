import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';

class UpdateQuoteNotifier extends StateNotifier<QuoteState> {
  UpdateQuoteNotifier(this._updateQuote, this._ref)
      : super(const QuoteState.initial());

  final UpdateQuote _updateQuote;
  final Ref _ref;

  Future<void> updateFavorite(Quote oldQuote) async {
    state = state.copyWith(isLoading: true);

    final favoriteValue = oldQuote.isFavorite == 0 ? 1 : 0;
    final newQuote = oldQuote.copyWith(isFavorite: favoriteValue);

    final result = await _updateQuote(newQuote);
    state = result.fold(
      (failure) => state.copyWith(
        message: failure.message,
        isLoading: false,
      ),
      (success) => state.copyWith(
        isLoading: false,
        quote: newQuote,
        allQuotes: state.allQuotes,
        favoritesQuotes: state.favoritesQuotes,
      ),
    );
    await _ref.read(getFavoritesQuotesProvider.notifier).getFavoritesQuotes();
    await _ref.read(getQuotesProvider.notifier).getQuotes();
  }
}
