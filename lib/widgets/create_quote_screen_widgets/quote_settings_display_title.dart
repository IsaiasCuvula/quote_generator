import 'package:flutter/material.dart';

class SettingsDisplayTitle extends StatelessWidget {
  const SettingsDisplayTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.headlineSmall,
    );
  }
}
