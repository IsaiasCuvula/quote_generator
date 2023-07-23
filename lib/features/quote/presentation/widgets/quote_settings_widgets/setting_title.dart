import 'package:flutter/material.dart';
import 'package:quote_generator/config/config.dart';

class SettingTitle extends StatelessWidget {
  const SettingTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.headlineSmall,
    );
  }
}
