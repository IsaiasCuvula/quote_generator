import 'package:equatable/equatable.dart';

class Quote extends Equatable {
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

  const Quote({
    this.id,
    required this.text,
    required this.author,
    required this.textAlign,
    required this.backgroundColor,
    required this.fontSize,
    required this.fontWeight,
    required this.wordSpacing,
    required this.letterSpacing,
    required this.isFavorite,
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

  Quote copyWith({
    int? id,
    String? text,
    String? author,
    String? textAlign,
    int? backgroundColor,
    double? fontSize,
    String? fontWeight,
    double? wordSpacing,
    double? letterSpacing,
    int? isFavorite,
  }) {
    return Quote(
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

  @override
  bool get stringify => true;
}
