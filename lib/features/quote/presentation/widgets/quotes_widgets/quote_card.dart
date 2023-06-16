import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/common/common.dart';

class QuoteCard extends StatelessWidget {
  QuoteCard({super.key, required this.quote});

  final Quote quote;
  final GlobalKey widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
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

    return Card(
      elevation: 2,
      color: Colors.grey[50],
      shape: RoundedRectangleBorder(
        borderRadius: Dimensions.kBorderRadiusAllSmallest,
      ),
      borderOnForeground: false,
      child: Column(
        children: [
          InkWell(
            borderRadius: Dimensions.kBorderRadiusAllSmallest,
            onTap: () {
              context.pushNamed(
                RoutesName.detailScreen,
                params: {'id': '${quote.id}'},
              );
            },
            child: RepaintBoundary(
              key: widgetKey,
              child: Container(
                width: double.infinity,
                padding: Dimensions.kPaddingAllLarge,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Dimensions.kRadiusAllSmallest,
                    topRight: Dimensions.kRadiusAllSmallest,
                  ),
                ),
                child: Column(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.quoteRight,
                      size: Dimensions.iconSizeSmall,
                      color: colorScheme.onSurface,
                    ).animate().scale(duration: 3.seconds).rotate(),
                    Text(
                      quote.text,
                      textAlign: Helpers.textAlignList[quote.textAlign],
                      style: quoteTextSyle,
                      maxLines: 5,
                    )
                        .animate()
                        .fade(
                          duration: Constants.kAnimationDuration,
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
                          duration: Constants.kAnimationDuration,
                        )
                        .fadeIn(),
                  ],
                ),
              ),
            ),
          ),
          CardFooter(
            quote: quote,
            widgetKey: widgetKey,
          ),
        ],
      ),
    );
  }
}
