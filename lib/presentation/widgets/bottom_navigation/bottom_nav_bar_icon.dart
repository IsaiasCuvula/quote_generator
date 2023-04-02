import 'package:flutter/material.dart';
import 'package:quote_generator/presentation/theme/dimensions.dart';

class BottomNavBarIcon extends StatelessWidget {
  const BottomNavBarIcon({
    Key? key,
    required this.displayIcon,
    required this.isSelected,
  }) : super(key: key);

  final IconData displayIcon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Color displayIconColor =
        isSelected ? colorScheme.primary : colorScheme.tertiaryContainer;
    return Icon(
      displayIcon,
      size: Dimensions.iconSizeMedium,
      color: displayIconColor,
    );
  }
}
