// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuoteModel _$$_QuoteModelFromJson(Map<String, dynamic> json) =>
    _$_QuoteModel(
      id: json['id'] as int?,
      text: json['text'] as String,
      author: json['author'] as String,
      textAlign: json['textAlign'] as String,
      backgroundColor: json['backgroundColor'] as int,
      fontSize: (json['fontSize'] as num).toDouble(),
      fontWeight: json['fontWeight'] as String,
      wordSpacing: (json['wordSpacing'] as num).toDouble(),
      letterSpacing: (json['letterSpacing'] as num).toDouble(),
      isFavorite: json['isFavorite'] as int? ?? 0,
    );

Map<String, dynamic> _$$_QuoteModelToJson(_$_QuoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'author': instance.author,
      'textAlign': instance.textAlign,
      'backgroundColor': instance.backgroundColor,
      'fontSize': instance.fontSize,
      'fontWeight': instance.fontWeight,
      'wordSpacing': instance.wordSpacing,
      'letterSpacing': instance.letterSpacing,
      'isFavorite': instance.isFavorite,
    };
