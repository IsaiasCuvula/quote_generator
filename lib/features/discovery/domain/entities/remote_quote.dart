import 'package:equatable/equatable.dart';

class RemoteQuote extends Equatable {
  final String quoteId;
  final String userId;
  final DateTime createdAt;
  final String quoteText;
  final String author;
  final String textAlign;
  final int backgroundColor;
  final double fontSize;
  final String fontWeight;
  final double wordSpacing;
  final double letterSpacing;
  final List<String> likes;
  const RemoteQuote({
    required this.quoteId,
    required this.userId,
    required this.createdAt,
    required this.quoteText,
    required this.author,
    required this.textAlign,
    required this.backgroundColor,
    required this.fontSize,
    required this.fontWeight,
    required this.wordSpacing,
    required this.letterSpacing,
    required this.likes,
  });

  @override
  List<Object> get props {
    return [
      quoteId,
      userId,
      createdAt,
      quoteText,
      author,
      textAlign,
      backgroundColor,
      fontSize,
      fontWeight,
      wordSpacing,
      letterSpacing,
      likes,
    ];
  }

  @override
  bool get stringify => true;

  RemoteQuote copyWith({
    String? quoteId,
    String? userId,
    DateTime? createdAt,
    String? quoteText,
    String? author,
    String? textAlign,
    int? backgroundColor,
    double? fontSize,
    String? fontWeight,
    double? wordSpacing,
    double? letterSpacing,
    List<String>? likes,
  }) {
    return RemoteQuote(
      quoteId: quoteId ?? this.quoteId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      quoteText: quoteText ?? this.quoteText,
      author: author ?? this.author,
      textAlign: textAlign ?? this.textAlign,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      likes: likes ?? this.likes,
    );
  }
}
