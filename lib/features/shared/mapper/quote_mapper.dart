import 'package:quote_generator/features/quote/quote.dart';

class QuoteMapper {
  static Quote toEntity(QuoteModel model) {
    return Quote(
      text: model.text,
      author: model.author,
      textAlign: model.textAlign,
      backgroundColor: model.backgroundColor,
      fontSize: model.fontSize,
      fontWeight: model.fontWeight,
      wordSpacing: model.wordSpacing,
      letterSpacing: model.letterSpacing,
    );
  }

  static QuoteModel toModel(Quote entity) {
    return QuoteModel(
      text: entity.text,
      author: entity.author,
      textAlign: entity.textAlign,
      backgroundColor: entity.backgroundColor,
      fontSize: entity.fontSize,
      fontWeight: entity.fontWeight,
      wordSpacing: entity.wordSpacing,
      letterSpacing: entity.letterSpacing,
    );
  }
}
