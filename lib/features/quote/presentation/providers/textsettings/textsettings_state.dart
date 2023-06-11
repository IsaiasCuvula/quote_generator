import 'package:flutter/material.dart';
import 'package:quote_generator/common/common.dart';

class TextSettingsState {
  TextAlign textAlign = TextAlign.start;
  Color backgroundColor = Colors.purple;
  double fontSize = Dimensions.quoteTextFontSizeSmall;
  FontWeight fontWeight = FontWeight.normal;
  double wordSpacing = Dimensions.quoteTextWordSpacingNone;
  double letterSpacing = Dimensions.quoteTextLetterSpacingNone;
  String quoteText = '';
  String quoteAuthor = 'unknown';
  int isFavorite = 0;
}
