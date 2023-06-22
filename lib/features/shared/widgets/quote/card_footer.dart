import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/download/download.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

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
    final l10n = context.l10n;
    final colorScheme = context.colorScheme;

    final unSelectedIconColor = colorScheme.primary;
    final selectedIconColor = colorScheme.primary;

    final iconsColor =
        quote.isFavorite == 1 ? selectedIconColor : unSelectedIconColor;

    return Consumer(
      builder: (ctx, ref, child) {
        return Container(
          height: Dimensions.kQuoteCardFooterHigh,
          padding: Dimensions.kPaddingAllSmall,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Dimensions.kHorizontalSpaceLarge,
              FavoriteButton(
                quote: quote,
                selectedIconColor: selectedIconColor,
              ),
              Dimensions.kHorizontalSpaceLarge,
              QuoteCardButton(
                child: FaIcon(
                  FontAwesomeIcons.copy,
                  size: Dimensions.iconSizeSmallest,
                  color: iconsColor,
                ),
                onPressed: () async {
                  await Clipboard.setData(
                    ClipboardData(
                      text: '${quote.text}\n${quote.author}',
                    ),
                  ).then((value) async {
                    await SharedHelpers.displaySnackbar(
                      ctx,
                      l10n.copied_to_clipboard,
                      true,
                    );
                  });
                },
              ),
              Dimensions.kHorizontalSpaceLarge,
              QuoteCardButton(
                child: FaIcon(
                  FontAwesomeIcons.shareNodes,
                  size: Dimensions.iconSizeSmallest,
                  color: iconsColor,
                ),
                onPressed: () async {
                  Helpers.shareQuote(quote.text, quote.author);
                },
              ),
              Dimensions.kHorizontalSpaceLarge,
              DownloadButton(
                iconsColor: iconsColor,
                widgetKey: widgetKey,
              ),
            ],
          ),
        );
      },
    );
  }
}
