import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/config/config.dart';

class BodyInfo extends StatelessWidget {
  const BodyInfo({
    Key? key,
    required this.displayTitle,
    required this.displayLabel,
    this.onTap,
    this.iconData,
  }) : super(key: key);

  final String displayTitle;
  final String displayLabel;
  final VoidCallback? onTap;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              displayTitle,
              style: textTheme.headlineMedium,
            ),
            Text(
              displayLabel,
              style: textTheme.bodySmall,
            ),
          ],
        ),
        IconButton(
          onPressed: onTap,
          icon: FaIcon(
            iconData,
            color: context.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
