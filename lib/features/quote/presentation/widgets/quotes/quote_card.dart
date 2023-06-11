import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/common/common.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    super.key,
    required this.quote,
  });

  final QuoteModel quote;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final autherTextStyle = textTheme.labelLarge?.copyWith(
      letterSpacing: quote.letterSpacing,
      color: colorScheme.onSurface,
    );
    final quoteTextSyle = TextStyle(
      color: colorScheme.onSurface,
      fontSize: quote.fontSize,
      wordSpacing: quote.wordSpacing,
      letterSpacing: quote.letterSpacing,
      fontWeight: Helpers.fontWeightList[quote.fontWeight],
    );

    final backgroundColor = Helpers.intToColor(quote.backgroundColor);

    return Container(
      width: double.infinity,
      padding: Dimensions.kPaddingAllLarge,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: Dimensions.kBorderRadiusAllSmall,
      ),
      child: Column(
        children: [
          FaIcon(
            FontAwesomeIcons.quoteRight,
            size: Dimensions.iconSizeSmall,
            color: colorScheme.onSurface,
          )
              .animate(
                onPlay: (controller) => controller.repeat(),
              )
              .scale(duration: 3.seconds)
              .rotate(),
          Text(
            quote.text,
            textAlign: Helpers.textAlignList[quote.textAlign],
            style: quoteTextSyle,
            maxLines: 6,
          )
              .animate()
              .fade(
                duration: Constants.kAnimationDuration,
              )
              .fadeIn(),
          Dimensions.kVerticalSpaceMedium,
          Text(
            '- ${quote.author}',
            textAlign: Helpers.textAlignList[quote.textAlign],
            maxLines: 1,
            style: autherTextStyle,
          )
              .animate()
              .fade(
                duration: Constants.kAnimationDuration,
              )
              .fadeIn(),
        ],
      ),
    );
  }
}
