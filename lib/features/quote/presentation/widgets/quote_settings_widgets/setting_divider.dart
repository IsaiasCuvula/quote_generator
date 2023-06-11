import 'package:flutter/material.dart';

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({
    Key? key,
    this.thickness = 2,
  }) : super(key: key);

  final double thickness;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Divider(
      color: colorScheme.secondary,
      thickness: thickness,
    );
  }
}
