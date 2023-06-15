import 'package:flutter/material.dart';
import 'package:quote_generator/common/common.dart';

class QuoteCardButton extends StatelessWidget {
  const QuoteCardButton({
    super.key,
    required this.child,
    this.onPressed,
  });
  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: Dimensions.kBorderRadiusAllSmallest,
      onTap: onPressed,
      child: child,
    );
  }
}
