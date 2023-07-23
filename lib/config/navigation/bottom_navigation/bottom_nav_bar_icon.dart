import 'package:flutter/material.dart';
import 'package:quote_generator/config/config.dart';

class BottomNavBarIcon extends StatelessWidget {
  const BottomNavBarIcon({
    Key? key,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.isSelected,
  }) : super(key: key);

  final IconData unselectedIcon;
  final IconData selectedIcon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final Color displayIconColor =
        isSelected ? colorScheme.tertiaryContainer : colorScheme.primary;
    final IconData displayIcon = isSelected ? selectedIcon : unselectedIcon;
    return Icon(
      displayIcon,
      size: Dimensions.iconSizeSmall,
      color: displayIconColor,
    );
  }
}
