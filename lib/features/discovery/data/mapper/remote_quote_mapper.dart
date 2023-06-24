import 'package:quote_generator/features/discovery/data/data.dart';
import 'package:quote_generator/features/discovery/domain/entities/remote_quote.dart';
import 'package:quote_generator/features/quote/quote.dart';

class RemoteQuoteMapper {
  static RemoteQuote toRemoteQuoteEntity(RemoteQuoteModel model) {
    return RemoteQuote(
      quoteId: model.quoteId,
      userId: model.userId,
      createdAt: model.createdAt,
      quoteText: model.quoteText,
      author: model.author,
      textAlign: model.textAlign,
      backgroundColor: model.backgroundColor,
      fontSize: model.fontSize,
      fontWeight: model.fontWeight,
      wordSpacing: model.wordSpacing,
      letterSpacing: model.letterSpacing,
      favorites: model.favorites,
    );
  }

  static RemoteQuoteModel toRemoteQuoteModel(RemoteQuote entity) {
    return RemoteQuoteModel(
      quoteId: entity.quoteId,
      userId: entity.userId,
      createdAt: entity.createdAt,
      quoteText: entity.quoteText,
      author: entity.author,
      textAlign: entity.textAlign,
      backgroundColor: entity.backgroundColor,
      fontSize: entity.fontSize,
      fontWeight: entity.fontWeight,
      wordSpacing: entity.wordSpacing,
      letterSpacing: entity.letterSpacing,
      favorites: entity.favorites,
    );
  }

  static Quote fromRemoteToLocalQuote(RemoteQuote quote) {
    return Quote(
      quoteText: quote.quoteText,
      author: quote.author,
      textAlign: quote.textAlign,
      backgroundColor: quote.backgroundColor,
      fontSize: quote.fontSize,
      fontWeight: quote.fontWeight,
      wordSpacing: quote.wordSpacing,
      letterSpacing: quote.letterSpacing,
      isFavorite: 0,
    );
  }

  static RemoteQuote fromLocalToRemoteQuote(Quote quote, String userId) {
    return RemoteQuote(
      quoteId: '',
      userId: userId,
      quoteText: quote.quoteText,
      createdAt: DateTime.now(),
      author: quote.author,
      textAlign: quote.textAlign,
      backgroundColor: quote.backgroundColor,
      fontSize: quote.fontSize,
      fontWeight: quote.fontWeight,
      wordSpacing: quote.wordSpacing,
      letterSpacing: quote.letterSpacing,
      favorites: const [],
    );
  }
}
