import 'package:flutter/material.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/shared/shared.dart';

class RemoteQuoteCard extends StatelessWidget {
  RemoteQuoteCard({super.key, required this.quote});

  final RemoteQuote quote;
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
          RemoteCardHeader(quote: quote),
          InkWell(
            borderRadius: Dimensions.kBorderRadiusAllSmallest,
            onTap: () {
              // context.pushNamed(
              //   RouteLocation.detailScreen,
              //   params: {'id': quote.quoteId},
              // );
            },
            child: RepaintBoundary(
              key: widgetKey,
              child: Container(
                width: double.infinity,
                padding: Dimensions.kPaddingAllLarge,
                decoration: BoxDecoration(
                  color: backgroundColor,
                ),
                child: QuoteCardBodyText(
                  colorScheme: colorScheme,
                  quote: RemoteQuoteMapper.fromRemoteToLocalQuote(quote),
                  quoteTextSyle: quoteTextSyle,
                  autherTextStyle: autherTextStyle,
                ),
              ),
            ),
          ),
          RemoteCardFooter(
            quote: quote,
            widgetKey: widgetKey,
          ),
        ],
      ),
    );
  }
}
