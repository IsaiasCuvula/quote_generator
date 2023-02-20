import 'package:flutter/material.dart';
import 'package:quote_generator/theme/dimensions.dart';

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

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
        ],
      ),
    );
  }
}
