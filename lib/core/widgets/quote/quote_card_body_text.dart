import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/core/core.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/config/config.dart';

class QuoteCardBodyText extends StatelessWidget {
  const QuoteCardBodyText({
    super.key,
    required this.colorScheme,
    required this.quote,
    required this.quoteTextSyle,
    required this.autherTextStyle,
  });

  final ColorScheme colorScheme;
  final Quote quote;
  final TextStyle quoteTextSyle;
  final TextStyle? autherTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaIcon(
          FontAwesomeIcons.quoteRight,
          size: Dimensions.iconSizeSmall,
          color: colorScheme.onSurface,
        ).animate().scale(duration: 3.seconds).rotate(),
        Text(
          quote.quoteText,
          textAlign: AppHelpers.textAlignList[quote.textAlign],
          style: quoteTextSyle,
          maxLines: 5,
        )
            .animate()
            .fade(
              duration: AppConstants.kAnimationDuration,
            )
            .fadeIn(),
        Dimensions.kVerticalSpaceMedium,
        Text(
          '- ${quote.author}',
          maxLines: 1,
          style: autherTextStyle,
        )
            .animate()
            .fade(
              duration: AppConstants.kAnimationDuration,
            )
            .fadeIn(),
      ],
    );
  }
}
