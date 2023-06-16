import 'package:flutter/material.dart';
import 'package:quote_generator/common/common.dart';
import 'package:uuid/uuid.dart';

class SharedHelpers {
  static displaySnackbar(BuildContext context, String message, bool isSucess) {
    final colorScheme = context.colorScheme;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: context.textTheme.bodyMedium,
        ),
        backgroundColor:
            isSucess ? colorScheme.onSecondary : colorScheme.onError,
      ),
    );
  }

  static String generateUUID() {
    const uuid = Uuid();
    return uuid.v4();
  }
}
