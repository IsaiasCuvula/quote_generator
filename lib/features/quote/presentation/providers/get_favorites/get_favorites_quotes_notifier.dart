import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/core/core.dart';

class GetFavoritesQuotesNotifier extends StateNotifier<QuoteState> {
  GetFavoritesQuotesNotifier(this._getQuotesUsecase)
      : super(const QuoteState.initial()) {
    getFavoritesQuotes();
  }
  final GetQuotes _getQuotesUsecase;

  Future<void> getFavoritesQuotes() async {
    state = state.copyWith(isLoading: true);

    final results = await _getQuotesUsecase(NoParams());

    state = results.fold(
      (failure) => state.copyWith(
        message: failure.message,
        isLoading: false,
      ),
      (quotes) {
        final favQuotes = quotes
            .where(
              (quote) => quote.isFavorite == 1,
            )
            .toList();
        return state.copyWith(
          favoritesQuotes: favQuotes,
          isLoading: false,
        );
      },
    );
  }
}
