import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/quote/utils/utils.dart';

class QuoteState {
  final QuoteModelList allQuotes;
  final QuoteModelList favoritesQuotes;
  final QuoteModelList searcherdQuotes;
  final QuoteModel? quote;
  const QuoteState(
    this.allQuotes,
    this.favoritesQuotes,
    this.searcherdQuotes,
    this.quote,
  );
}
