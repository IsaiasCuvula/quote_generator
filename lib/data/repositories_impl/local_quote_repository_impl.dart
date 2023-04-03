import 'package:quote_generator/data/models/quote_model.dart';
import 'package:quote_generator/domain/repositories/repositories.dart';

class LocalQuoteRepositoryImpl implements QuoteRepository {
  @override
  Future<void> createQuote(QuoteModel quote) {
    // TODO: implement createQuote
    throw UnimplementedError();
  }

  @override
  Future<void> deleteQuote(int id) {
    // TODO: implement deleteQuote
    throw UnimplementedError();
  }

  @override
  Future<QuoteModel> getQuoteById(int id) {
    // TODO: implement getQuoteById
    throw UnimplementedError();
  }

  @override
  Future<List<QuoteModel>> getQuotes() {
    // TODO: implement getQuotes
    throw UnimplementedError();
  }

  @override
  Future<void> updateQuote(QuoteModel quote) {
    // TODO: implement updateQuote
    throw UnimplementedError();
  }
}
