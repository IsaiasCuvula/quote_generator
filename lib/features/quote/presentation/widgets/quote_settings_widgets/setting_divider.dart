import 'package:flutter/material.dart';
import 'package:quote_generator/common/common.dart';

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({
    Key? key,
    this.thickness = 2,
  }) : super(key: key);

  final double thickness;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Divider(
      color: colorScheme.secondary,
      thickness: thickness,
    );
  }
}
