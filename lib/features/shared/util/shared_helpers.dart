import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class SharedHelpers {
  static displaySnackbar(BuildContext context, String message, bool isSucess) {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        backgroundColor: isSucess ? Colors.green : Colors.red,
      ),
    );
  }

  static String generateUUID() {
    const uuid = Uuid();
    return uuid.v4();
  }
}
