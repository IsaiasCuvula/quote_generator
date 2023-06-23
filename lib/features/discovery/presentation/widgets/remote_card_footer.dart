import 'package:flutter/material.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/download/download.dart';
import 'package:quote_generator/features/shared/shared.dart';

class RemoteCardFooter extends StatelessWidget {
  const RemoteCardFooter({
    super.key,
    required this.quote,
    required this.widgetKey,
  });

  final RemoteQuote quote;
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
          SaveToFavoriteButton(quote: quote),
          Dimensions.kHorizontalSpaceSmall,
          FavoriteCounter(quoteId: quote.quoteId),
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
