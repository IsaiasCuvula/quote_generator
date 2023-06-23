import 'package:equatable/equatable.dart';
import 'package:quote_generator/features/discovery/discovery.dart';

class RemoteQuoteModel extends Equatable {
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

  const RemoteQuoteModel({
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
    ];
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      QuoteKey.quoteId: quoteId,
      QuoteKey.userId: userId,
      QuoteKey.createdAt: createdAt.millisecondsSinceEpoch,
      QuoteKey.quoteText: quoteText,
      QuoteKey.author: author,
      QuoteKey.textAlign: textAlign,
      QuoteKey.backgroundColor: backgroundColor,
      QuoteKey.fontSize: fontSize,
      QuoteKey.fontWeight: fontWeight,
      QuoteKey.wordSpacing: wordSpacing,
      QuoteKey.letterSpacing: letterSpacing,
    };
  }

  factory RemoteQuoteModel.fromJson(Map<String, dynamic> map) {
    return RemoteQuoteModel(
      quoteId: map[QuoteKey.quoteId] as String,
      userId: map[QuoteKey.userId] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        map[QuoteKey.createdAt] as int,
      ),
      quoteText: map[QuoteKey.quoteText] as String,
      author: map[QuoteKey.author] as String,
      textAlign: map[QuoteKey.textAlign] as String,
      backgroundColor: map[QuoteKey.backgroundColor] as int,
      fontSize: map[QuoteKey.fontSize] as double,
      fontWeight: map[QuoteKey.fontWeight] as String,
      wordSpacing: map[QuoteKey.wordSpacing] as double,
      letterSpacing: map[QuoteKey.letterSpacing] as double,
    );
  }
}
