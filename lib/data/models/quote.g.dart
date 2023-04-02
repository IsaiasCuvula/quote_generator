// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quote _$$_QuoteFromJson(Map<String, dynamic> json) => _$_Quote(
      id: json['id'] as int,
      text: json['text'] as String,
      author: json['author'] as String,
      textAlign: json['textAlign'] as String,
      backgroundColor: json['backgroundColor'] as String,
      fontSize: (json['fontSize'] as num).toDouble(),
      fontWeight: json['fontWeight'] as String,
      fontStyle: json['fontStyle'] as String,
      wordSpacing: (json['wordSpacing'] as num).toDouble(),
      letterSpacing: (json['letterSpacing'] as num).toDouble(),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$_QuoteToJson(_$_Quote instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'author': instance.author,
      'textAlign': instance.textAlign,
      'backgroundColor': instance.backgroundColor,
      'fontSize': instance.fontSize,
      'fontWeight': instance.fontWeight,
      'fontStyle': instance.fontStyle,
      'wordSpacing': instance.wordSpacing,
      'letterSpacing': instance.letterSpacing,
      'isFavorite': instance.isFavorite,
    };
