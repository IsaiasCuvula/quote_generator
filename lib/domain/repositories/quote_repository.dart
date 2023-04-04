import 'package:quote_generator/data/data.dart';

abstract class QuoteRepository {
  Future<void> addQuote(QuoteModel quote);
  //Future<QuoteModel> getQuoteById(int id);
  Future<List<QuoteModel>> getQuotes();
  Future<void> updateQuote(QuoteModel quote);
  Future<void> deleteQuote(int id);
}
