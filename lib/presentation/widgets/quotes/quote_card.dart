import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/config/theme/dimensions.dart';
import 'package:quote_generator/data/data.dart';
import 'package:quote_generator/utils/helpers.dart';

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
    final autherTextStyle = textTheme.labelLarge?.copyWith(
      letterSpacing: quote.letterSpacing,
      color: theme.colorScheme.surface,
    );
    final quoteTextSyle = TextStyle(
      color: theme.colorScheme.surface,
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
            color: theme.colorScheme.surface,
          ),
          Text(
            quote.text,
            textAlign: Helpers.textAlignList[quote.textAlign],
            style: quoteTextSyle,
            maxLines: 6,
          ),
          Dimensions.kVerticalSpaceMedium,
          Text(
            '- ${quote.author}',
            textAlign: Helpers.textAlignList[quote.textAlign],
            maxLines: 1,
            style: autherTextStyle,
          ),
        ],
      ),
    );
  }
}
