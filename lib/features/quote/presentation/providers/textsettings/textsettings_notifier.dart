import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'textsettings_state.dart';

class TextSettingsNotifier extends StateNotifier<TextSettingsState> {
  TextSettingsNotifier() : super(TextSettingsState());

  void setAlign(TextAlign align) {
    state = state.copyWith(textAlign: align);
  }

  void setColor(Color color) {
    state = state.copyWith(backgroundColor: color);
  }

  void setFontSize(double fontSize) {
    state = state.copyWith(fontSize: fontSize);
  }

  void setFontWeight(FontWeight fontWeight) {
    state = state.copyWith(fontWeight: fontWeight);
  }

  void setFontStyle(FontStyle fontStyle) {
    state = state.copyWith(fontStyle: fontStyle);
  }

  void setWordSpacing(double wordSpacing) {
    state = state.copyWith(wordSpacing: wordSpacing);
  }

  void setLetterSpacing(double letterSpacing) {
    state = state.copyWith(letterSpacing: letterSpacing);
  }

  void setQuoteText(String text) {
    state = state.copyWith(quoteText: text);
  }

  void setQuoteAuthor(String author) {
    state = state.copyWith(quoteAuthor: author);
  }
}

extension TextSettingsExtension on TextSettingsState {
  TextSettingsState copyWith({
    TextAlign? textAlign,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? wordSpacing,
    double? letterSpacing,
    TextDecoration? textDecoration,
    String? quoteText,
    String? quoteAuthor,
    int? isFavorite,
  }) {
    return TextSettingsState()
      ..textAlign = textAlign ?? this.textAlign
      ..backgroundColor = backgroundColor ?? this.backgroundColor
      ..fontSize = fontSize ?? this.fontSize
      ..fontWeight = fontWeight ?? this.fontWeight
      ..wordSpacing = wordSpacing ?? this.wordSpacing
      ..letterSpacing = letterSpacing ?? this.letterSpacing
      ..quoteText = quoteText ?? this.quoteText
      ..quoteAuthor = quoteAuthor ?? this.quoteAuthor
      ..isFavorite = isFavorite ?? this.isFavorite;
  }
}
