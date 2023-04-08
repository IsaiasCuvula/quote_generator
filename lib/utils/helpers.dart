import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/translations/l10n.dart';

class Helpers {
  //Quote Text Settings
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

  // //Others
  static int stringToInt(String value) {
    try {
      return int.parse(value);
    } catch (e) {
      rethrow;
    }
  }

  static showAlertDialog({
    required BuildContext context,
    VoidCallback? onDelete,
  }) {
    Widget cancelButton = TextButton(
      child: Text(context.l10n.cancel.toUpperCase()),
      onPressed: () => context.pop(),
    );
    Widget continueButton = TextButton(
      onPressed: onDelete,
      child: Text(context.l10n.delete.toUpperCase()),
    );

    AlertDialog alert = AlertDialog(
      title: Text(context.l10n.alert_title),
      content: Text(context.l10n.alert_content),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
