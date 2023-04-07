import 'package:quote_generator/data/data.dart';
import 'package:quote_generator/domain/repositories/repositories.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteLocalDatasource _localDatasource;
  QuoteRepositoryImpl(this._localDatasource);

  @override
  Future<void> addQuote(QuoteModel quote) async {
    try {
      await _localDatasource.addQuote(quote);
    } catch (e) {
      throw Exception('Failed to add quote: $e');
    }
  }

  @override
  Future<void> deleteQuote(int id) async {
    try {
      await _localDatasource.deleteQuote(id);
    } catch (e) {
      throw Exception('Failed to delete quote: $e');
    }
  }

  @override
  Future<QuoteModel?> getQuoteById(int id) async {
    try {
      final quote = await _localDatasource.getQuoteById(id);
      return quote;
    } catch (e) {
      throw Exception('Failed to get quote with this: $id id, $e');
    }
  }

  @override
  Future<QuoteList> getQuotes() async {
    try {
      final quotes = await _localDatasource.getQuotes();
      return quotes;
    } catch (e) {
      throw Exception('Failed to get quotes: $e');
    }
  }

  @override
  Future<void> updateQuote(QuoteModel quote) async {
    try {
      await _localDatasource.updateQuote(quote);
    } catch (e) {
      throw Exception('Failed to update quote: $e');
    }
  }
}
