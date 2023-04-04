import 'package:flutter/widgets.dart';

class Helpers {
  static final Map<String, TextAlign> stringToTextAlign = {
    'left': TextAlign.left,
    'center': TextAlign.center,
    'right': TextAlign.right,
    'justify': TextAlign.justify,
  };

  static final Map<String, FontWeight> stringToFontWeight = {
    'normal': FontWeight.normal,
    'bold': FontWeight.bold,
  };
}
