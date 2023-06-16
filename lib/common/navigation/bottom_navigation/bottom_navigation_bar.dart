import 'package:flutter/material.dart';
import 'package:quote_generator/common/common.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.items});
  final List<BottomNavBarItem> items;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.colorScheme.secondary,
      borderRadius: Dimensions.kBorderRadiusAllLarge,
      type: MaterialType.canvas,
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: Dimensions.kPaddingNavBottom,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: items,
        ),
      ),
    );
  }
}
