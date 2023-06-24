import 'package:flutter/foundation.dart' show immutable;

@immutable
class QuoteKey {
  static const quoteId = 'quoteId';
  static const userId = 'userId';
  static const quoteText = 'quoteText';
  static const createdAt = 'createdAt';
  static const author = 'author';
  static const textAlign = 'textAlign';
  static const backgroundColor = 'backgroundColor';
  static const fontSize = 'fontSize';
  static const fontWeight = 'fontWeight';
  static const wordSpacing = 'wordSpacing';
  static const letterSpacing = 'letterSpacing';
  static const favorites = 'favorites';
  const QuoteKey._();
}
