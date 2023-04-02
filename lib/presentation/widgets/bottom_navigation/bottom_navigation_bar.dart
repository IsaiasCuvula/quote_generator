import 'package:flutter/material.dart';
import 'package:quote_generator/presentation/theme/theme.dart';
import 'bottom_nav_bar_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.items});
  final List<BottomNavBarItem> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.secondary,
      borderRadius: Dimensions.kBorderRadiusAllLarge,
      type: MaterialType.canvas,
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: Dimensions.kPaddingAllLarge,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: items,
        ),
      ),
    );
  }
}
