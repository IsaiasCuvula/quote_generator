import 'package:equatable/equatable.dart';

class QuoteModel extends Equatable {
  final int? id;
  final String text;
  final String author;
  final String textAlign;
  final int backgroundColor;
  final double fontSize;
  final String fontWeight;
  final double wordSpacing;
  final double letterSpacing;
  final int isFavorite;

  const QuoteModel({
    this.id,
    required this.text,
    required this.author,
    required this.textAlign,
    required this.backgroundColor,
    required this.fontSize,
    required this.fontWeight,
    required this.wordSpacing,
    required this.letterSpacing,
    this.isFavorite = 0,
  });

  @override
  List<Object> get props {
    return [
      id!,
      text,
      author,
      textAlign,
      backgroundColor,
      fontSize,
      fontWeight,
      wordSpacing,
      letterSpacing,
      isFavorite,
    ];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'author': author,
      'textAlign': textAlign,
      'backgroundColor': backgroundColor,
      'fontSize': fontSize,
      'fontWeight': fontWeight,
      'wordSpacing': wordSpacing,
      'letterSpacing': letterSpacing,
      'isFavorite': isFavorite,
    };
  }

  factory QuoteModel.fromJson(Map<String, dynamic> map) {
    return QuoteModel(
      id: map['id'] as int,
      text: map['text'] as String,
      author: map['author'] as String,
      textAlign: map['textAlign'] as String,
      backgroundColor: map['backgroundColor'] as int,
      fontSize: map['fontSize'] as double,
      fontWeight: map['fontWeight'] as String,
      wordSpacing: map['wordSpacing'] as double,
      letterSpacing: map['letterSpacing'] as double,
      isFavorite: map['isFavorite'] as int,
    );
  }

  QuoteModel copyWith({
    String? text,
    String? author,
    String? textAlign,
    int? backgroundColor,
    double? fontSize,
    String? fontWeight,
    double? wordSpacing,
    double? letterSpacing,
    int? isFavorite,
    int? id,
  }) {
    return QuoteModel(
      id: id ?? this.id,
      text: text ?? this.text,
      author: author ?? this.author,
      textAlign: textAlign ?? this.textAlign,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
