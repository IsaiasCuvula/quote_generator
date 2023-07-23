import 'package:flutter/material.dart';
import 'package:quote_generator/config/config.dart';

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({
    Key? key,
    this.thickness = 2,
  }) : super(key: key);

  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.colorScheme.secondary,
      thickness: thickness,
    );
  }
}
