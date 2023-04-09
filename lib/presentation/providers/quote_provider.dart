import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/data/data.dart';
import 'package:quote_generator/domain/domain.dart';
import 'package:quote_generator/presentation/presentation.dart';
import 'package:quote_generator/utils/helpers.dart';

final quoteProvider = StateNotifierProvider<QuoteNotifier, QuoteState>((ref) {
  final quoteRepository = ref.read(quoteRepositoryProvider);
  return QuoteNotifier(quoteRepository, ref);
});

class QuoteState {
  final QuoteList quotes;
  final QuoteList favoritesQuotes;
  final QuoteModel? quote;
  const QuoteState(
    this.quotes,
    this.favoritesQuotes,
    this.quote,
  );
}

class QuoteNotifier extends StateNotifier<QuoteState> {
  QuoteNotifier(this._quoteRepository, this._ref)
      : super(const QuoteState([], [], null));

  final QuoteRepository _quoteRepository;
  final Ref _ref;

  // the quotes will be loaded from the repository the first time the
  //state getter is accessed, and subsequent
  // accesses will return the cached data.
  @override
  QuoteState get state {
    if (super.state.quotes.isEmpty && super.state.quote == null) {
      _loadQuotes();
    }
    return super.state;
  }

  Future<void> _loadQuotes() async {
    final quotes = await _quoteRepository.getQuotes();
    final favQuotes = _getFavoritesQuotes(quotes);
    state = QuoteState(quotes, favQuotes, state.quote);
  }

  QuoteList _getFavoritesQuotes(QuoteList quoteList) {
    final QuoteList favQuotes = [];
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
      state = QuoteState(state.quotes, state.favoritesQuotes, quote);
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
        state = QuoteState(state.quotes, state.favoritesQuotes, newQuote);
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
}
