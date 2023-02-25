import 'package:flutter/material.dart';
import 'package:quote_generator/theme/dimensions.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    super.key,
    required this.quoteText,
    required this.backgroundColor,
  });

  final String quoteText;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: Dimensions.kBorderRadiusAllSmall,
      ),
      child: Padding(
        padding: Dimensions.kPaddingAllLarge,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              quoteText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
