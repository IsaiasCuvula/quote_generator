import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/data/data.dart';
import 'package:quote_generator/domain/domain.dart';
import 'package:quote_generator/presentation/presentation.dart';

final quoteProvider = StateNotifierProvider<QuoteNotifier, QuoteList>((ref) {
  final quoteRepository = ref.read(quoteRepositoryProvider);
  return QuoteNotifier(quoteRepository, ref);
});

// final todosListState = StateNotifierProvider<TodosStateNotifier, Todos>(
//   (ref) => QuoteNotifier(ref),
// );

// final quotesListModel = Provider<TodosStateNotifier>((ref) {
//   return ref.watch(todosListState.notifier);
// });

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
        textAlign: textSettings.textAlign.toString().split('.').last,
        backgroundColor: textSettings.backgroundColor.value,
        fontSize: textSettings.fontSize,
        fontWeight: textSettings.fontWeight.toString().split('.').last,
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
}
