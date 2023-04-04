import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'quote_model.freezed.dart';
part 'quote_model.g.dart';

@freezed
class QuoteModel with _$QuoteModel {
  const factory QuoteModel({
    int? id,
    required String text,
    required String author,
    required String textAlign,
    required int backgroundColor,
    required double fontSize,
    required String fontWeight,
    required double wordSpacing,
    required double letterSpacing,
    @Default(0) int isFavorite,
  }) = _QuoteModel;

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);
}
