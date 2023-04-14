import 'package:flutter/material.dart';
import 'package:quote_generator/config/config.dart';

class TextSettingItemContainer extends StatelessWidget {
  const TextSettingItemContainer({
    Key? key,
    required this.child,
    this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = isSelected ? colorScheme.secondary : Colors.transparent;
    return InkWell(
      onTap: onTap,
      borderRadius: Dimensions.kBorderRadiusAllMedium,
      child: Container(
        padding: Dimensions.kPaddingAllSmall,
        decoration: BoxDecoration(
          borderRadius: Dimensions.kBorderRadiusAllSmallest,
          color: color,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
