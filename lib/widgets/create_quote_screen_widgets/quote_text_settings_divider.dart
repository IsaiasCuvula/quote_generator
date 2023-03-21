import 'package:flutter/material.dart';

class TextSettingsDivider extends StatelessWidget {
  const TextSettingsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Divider(
      color: colorScheme.secondary,
      thickness: 2,
    );
  }
}
