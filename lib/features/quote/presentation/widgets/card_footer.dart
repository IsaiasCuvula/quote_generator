import 'package:flutter/material.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/features/features.dart';
import 'package:quote_generator/core/core.dart';

class CardFooter extends StatelessWidget {
  const CardFooter({
    super.key,
    required this.quote,
    required this.widgetKey,
  });

  final Quote quote;
  final GlobalKey widgetKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.kQuoteCardFooterHigh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Dimensions.kHorizontalSpaceLarge,
          FavoriteButton(quote: quote),
          Dimensions.kHorizontalSpaceLarge,
          CopyToClipboardButton(
            quoteText: quote.quoteText,
            quoteAuthor: quote.author,
          ),
          Dimensions.kHorizontalSpaceLarge,
          ShareQuoteButton(
            quoteText: quote.quoteText,
            quoteAuthor: quote.author,
          ),
          Dimensions.kHorizontalSpaceLarge,
          DownloadButton(widgetKey: widgetKey),
        ],
      ),
    );
  }
}
