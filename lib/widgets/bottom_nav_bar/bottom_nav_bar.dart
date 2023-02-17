import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_generator/constants/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.items});
  final List<BottomNavBarItem> items;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.canvas,
      shape: const StadiumBorder(),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: Constants.kPadding10,
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
