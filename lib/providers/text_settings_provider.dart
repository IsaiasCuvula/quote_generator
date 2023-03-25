import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/theme/theme.dart';

final textSettingsProvider =
    StateNotifierProvider.autoDispose<TextSettingsNotifier, TextSettings>(
        (ref) {
  return TextSettingsNotifier();
});

class TextSettings {
  TextAlign textAlign = TextAlign.start;
  Color backgroundColor = Colors.purple;
  double fontSize = Dimensions.quoteTextFontSizeMedium;
  FontWeight fontWeight = FontWeight.bold;
  FontStyle fontStyle = FontStyle.italic;
  double wordSpacing = Dimensions.quoteTextWordSpacingSmall;
  double letterSpacing = Dimensions.quoteTextLetterSpacingNone;
}

class TextSettingsNotifier extends StateNotifier<TextSettings> {
  TextSettingsNotifier() : super(TextSettings());

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
}

extension TextSettingsExtension on TextSettings {
  TextSettings copyWith({
    TextAlign? textAlign,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? wordSpacing,
    double? letterSpacing,
  }) {
    return TextSettings()
      ..textAlign = textAlign ?? this.textAlign
      ..backgroundColor = backgroundColor ?? this.backgroundColor
      ..fontSize = fontSize ?? this.fontSize
      ..fontWeight = fontWeight ?? this.fontWeight
      ..fontStyle = fontStyle ?? this.fontStyle
      ..wordSpacing = wordSpacing ?? this.wordSpacing
      ..letterSpacing = letterSpacing ?? this.letterSpacing;
  }
}
