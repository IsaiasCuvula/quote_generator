import 'package:flutter/material.dart';

class Helpers {
  static final Map<String, TextAlign> textAlignList = {
    'left': TextAlign.left,
    'center': TextAlign.center,
    'right': TextAlign.right,
    'justify': TextAlign.justify,
  };

  static final Map<String, FontWeight> fontWeightList = {
    'normal': FontWeight.normal,
    'bold': FontWeight.bold,
  };

  static Color intToColor(int intColor) {
    try {
      return Color(intColor);
    } catch (e) {
      return Colors.teal;
    }
  }

  static String textAlignToString(TextAlign textAlign) {
    try {
      return textAlign.toString().split('.').last;
    } catch (e) {
      return 'center';
    }
  }

  static String fontWeightToString(FontWeight fontWeight) {
    try {
      return fontWeight.toString().split('.').last;
    } catch (e) {
      return 'normal';
    }
  }
}
