import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/data/data.dart';
import 'package:quote_generator/domain/domain.dart';
import 'package:quote_generator/presentation/presentation.dart';
import 'package:quote_generator/utils/helpers.dart';

final quoteProvider = StateNotifierProvider<QuoteNotifier, QuoteList>((ref) {
  final quoteRepository = ref.read(quoteRepositoryProvider);
  return QuoteNotifier(quoteRepository, ref);
});

final quoteByIdProvider =
    FutureProvider.autoDispose.family<QuoteModel?, int>((ref, id) async {
  final response = ref.watch(quoteProvider.notifier);
  return response.getQuoteById(id);
});

class QuoteNotifier extends StateNotifier<QuoteList> {
  QuoteNotifier(this._quoteRepository, this._ref) : super([]);

  final QuoteRepository _quoteRepository;
  final Ref _ref;

  // the quotes will be loaded from the repository the first time the
  //state getter is accessed, and subsequent
  // accesses will return the cached data.
  @override
  QuoteList get state {
    if (super.state.isEmpty) {
      _loadQuotes();
    }
    return super.state;
  }

  Future<void> _loadQuotes() async {
    state = await _quoteRepository.getQuotes();
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

  Future<QuoteModel?> getQuoteById(int id) async {
    try {
      final quote = await _quoteRepository.getQuoteById(id);
      return quote;
    } catch (e) {
      rethrow;
    }
  }
}
