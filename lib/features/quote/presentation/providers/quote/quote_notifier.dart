import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';

class QuoteNotifier extends StateNotifier<QuoteState> {
  QuoteNotifier(this._quoteRepository, this._ref)
      : super(const QuoteState([], [], [], null)) {
    _loadQuotes();
  }

  final QuoteRepository _quoteRepository;
  final Ref _ref;

  Future<void> _loadQuotes() async {
    final quotes = await _quoteRepository.getQuotes();
    final favQuotes = _getFavoritesQuotes(quotes);
    state = QuoteState(
      quotes,
      favQuotes,
      state.searcherdQuotes,
      state.quote,
    );
  }

  QuoteModelList _getFavoritesQuotes(QuoteModelList quoteList) {
    final QuoteModelList favQuotes = [];
    for (QuoteModel quote in quoteList) {
      if (quote.isFavorite == 1) {
        favQuotes.insert(0, quote);
      }
    }
    return favQuotes;
  }

  Future<void> addQuote() async {
    try {
      final textSettings = _ref.read(textSettingsProvider);

      final quote = QuoteModel(
        text: textSettings.quoteText,
        author: textSettings.quoteAuthor,
        textAlign: Helpers.textAlignToString(textSettings.textAlign),
        backgroundColor: textSettings.backgroundColor.value,
        fontSize: textSettings.fontSize,
        fontWeight: Helpers.fontWeightToString(textSettings.fontWeight),
        wordSpacing: textSettings.wordSpacing,
        letterSpacing: textSettings.letterSpacing,
      );

      await _quoteRepository.addQuote(quote).then((value) async {
        await _loadQuotes();
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getQuoteById(int id) async {
    try {
      final quote = await _quoteRepository.getQuoteById(id);
      state = QuoteState(
        state.allQuotes,
        state.favoritesQuotes,
        state.searcherdQuotes,
        quote,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateFavorite(QuoteModel oldQuote) async {
    try {
      final newFavorite = oldQuote.isFavorite == 0 ? 1 : 0;
      final newQuote = oldQuote.copyWith(isFavorite: newFavorite);
      await _quoteRepository.updateQuote(newQuote);
      await _quoteRepository.getQuoteById(newQuote.id!).then((newQuote) {
        state = QuoteState(
          state.allQuotes,
          state.favoritesQuotes,
          state.searcherdQuotes,
          newQuote,
        );
      });
      _loadQuotes();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteQuote(int id) async {
    try {
      await _quoteRepository.deleteQuote(id).then((value) async {
        await _loadQuotes();
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> searchQuote(String query) async {
    try {
      await _quoteRepository
          .searchQuote(query)
          .then((newSearcherdQuotes) async {
        state = QuoteState(
          state.allQuotes,
          state.favoritesQuotes,
          newSearcherdQuotes,
          state.quote,
        );
      });
      await _loadQuotes();
    } catch (e) {
      rethrow;
    }
  }

  void clearSearchedQuotesEvent() async {
    state = QuoteState(
      state.allQuotes,
      state.favoritesQuotes,
      [],
      state.quote,
    );
    await _loadQuotes();
  }
}
