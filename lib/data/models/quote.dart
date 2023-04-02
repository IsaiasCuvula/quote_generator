import 'package:freezed_annotation/freezed_annotation.dart';
part 'quote.freezed.dart';
part 'quote.g.dart';

@freezed
class Quote with _$Quote {
  const factory Quote({
    required int id,
    required String text,
    required String author,
    required String textAlign,
    required String backgroundColor,
    required double fontSize,
    required String fontWeight,
    required String fontStyle,
    required double wordSpacing,
    required double letterSpacing,
    @Default(false) bool isFavorite,
  }) = _Quote;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
}
