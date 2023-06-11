import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/quote/utils/utils.dart';

abstract class QuoteRepository {
  Future<void> addQuote(QuoteModel quote);
  Future<QuoteModel?> getQuoteById(int id);
  Future<QuoteList> getQuotes();
  Future<void> updateQuote(QuoteModel quote);
  Future<void> deleteQuote(int id);
  Future<QuoteList> searchQuote(String query);
}
