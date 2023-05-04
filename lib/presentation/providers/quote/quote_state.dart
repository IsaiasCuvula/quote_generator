import 'package:quote_generator/data/data.dart';
import 'package:quote_generator/utils/utils.dart';

class QuoteState {
  final QuoteList allQuotes;
  final QuoteList favoritesQuotes;
  final QuoteList searcherdQuotes;
  final QuoteModel? quote;
  const QuoteState(
    this.allQuotes,
    this.favoritesQuotes,
    this.searcherdQuotes,
    this.quote,
  );
}
