import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseFieldName {
  static const userId = 'userId';
  //quotes
  static const quoteId = 'quoteId';
  static const createdAt = 'createdAt';
  static const quoteText = 'quoteText';
  static const author = 'author';
  static const textAlign = 'textAlign';
  static const backgroundColor = 'backgroundColor';
  static const fontSize = 'fontSize';
  static const fontWeight = 'fontWeight';
  static const wordSpacing = 'wordSpacing';
  static const letterSpacing = 'letterSpacing';
  static const likes = 'likes';

  //users
  static const displayName = 'displayName';
  static const email = 'email';
  static const imageUrl = 'imageUrl';

  const FirebaseFieldName._();
}
