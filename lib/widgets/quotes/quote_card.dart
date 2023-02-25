import 'package:flutter/material.dart';
import 'package:quote_generator/theme/dimensions.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    super.key,
    required this.quoteText,
    required this.backgroundColor,
    required this.author,
  });

  final String quoteText;
  final String author;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final autherTextStyle = theme.labelLarge?.copyWith(
      letterSpacing: 3,
    );
    final quoteTextSyle = theme.bodyMedium;

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
              style: quoteTextSyle,
            ),
            Dimensions.kVerticalSpaceMedium,
            Text(
              '- $author',
              textAlign: TextAlign.center,
              maxLines: 1,
              style: autherTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
