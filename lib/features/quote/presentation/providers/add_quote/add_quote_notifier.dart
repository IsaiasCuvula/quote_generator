import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

class AddQuoteNotifier extends StateNotifier<QuoteState> {
  AddQuoteNotifier(this._addQuote, this._ref)
      : super(const QuoteState.initial());

  final AddQuote _addQuote;
  final Ref _ref;

  Future<void> addQuote() async {
    state = state.copyWith(isLoading: true);
    final result = await _addQuote(_createdQuote());
    state = result.fold(
      (failure) => state.copyWith(
        message: failure.message,
        isLoading: false,
      ),
      (success) => state.copyWith(
        isLoading: false,
      ),
    );
    _ref.read(getQuotesProvider.notifier).getQuotes();
  }

  Quote _createdQuote() {
    final textSettings = _ref.read(textSettingsProvider);
    return Quote(
      text: textSettings.quoteText,
      author: textSettings.quoteAuthor,
      textAlign: Helpers.textAlignToString(textSettings.textAlign),
      backgroundColor: textSettings.backgroundColor.value,
      fontSize: textSettings.fontSize,
      fontWeight: Helpers.fontWeightToString(textSettings.fontWeight),
      wordSpacing: textSettings.wordSpacing,
      letterSpacing: textSettings.letterSpacing,
      isFavorite: 0,
    );
  }
}
