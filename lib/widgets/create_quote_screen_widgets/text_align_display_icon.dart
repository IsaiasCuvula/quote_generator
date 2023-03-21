import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextAlignDisplayIcon extends StatelessWidget {
  const TextAlignDisplayIcon({
    super.key,
    required this.isSelected,
    required this.icon,
  });

  final bool isSelected;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final color =
        isSelected ? colorScheme.onBackground : colorScheme.tertiaryContainer;
    return FaIcon(
      icon,
      color: color,
    );
  }
}
