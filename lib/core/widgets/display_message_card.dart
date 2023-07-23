import 'package:flutter/material.dart';
import 'package:quote_generator/config/config.dart';

class DisplayErrorMessage extends StatelessWidget {
  const DisplayErrorMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Center(
      child: Text(
        message,
        style: textTheme.bodyMedium?.copyWith(color: Colors.red),
        textAlign: TextAlign.start,
      ),
    );
  }
}
