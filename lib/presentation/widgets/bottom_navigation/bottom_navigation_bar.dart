import 'package:flutter/material.dart';
import 'package:quote_generator/presentation/theme/theme.dart';
import 'bottom_nav_bar_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.items});
  final List<BottomNavBarItem> items;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.canvas,
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: Dimensions.kPaddingBottomNavBar,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: items,
        ),
      ),
    );
  }
}
