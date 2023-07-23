import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';

class AppHelpers {
//Quote Text Settings
  static final Map<String, TextAlign> textAlignList = {
    'left': TextAlign.left,
    'center': TextAlign.center,
    'right': TextAlign.right,
    'justify': TextAlign.justify,
  };

  static final Map<String, FontWeight> fontWeightList = {
    'normal': FontWeight.normal,
    'w700': FontWeight.bold,
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

  //Others
  static int stringToInt(String value) {
    try {
      return int.parse(value);
    } catch (e) {
      rethrow;
    }
  }

  static String generateUUID() {
    const uuid = Uuid();
    return uuid.v4();
  }

  static Future<void> shareQuote(String quoteDescription, String author) async {
    await Share.share('${quoteDescription.trim()} \n\n- $author');
  }
}
