import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/download/presentation/providers/save_quote/save_quote.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/util/shared_helpers.dart';

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
    final displayFavoriteIcon = quote.isFavorite == 1
        ? FontAwesomeIcons.solidHeart
        : FontAwesomeIcons.heart;

    final unSelectedIconColor = colorScheme.onPrimary;
    final selectedIconColor = colorScheme.onPrimary;

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
              QuoteCardButton(
                child: FaIcon(
                  displayFavoriteIcon,
                  size: Dimensions.iconSizeSmallest,
                  color: selectedIconColor,
                ),
                onPressed: () async {
                  await ref
                      .read(updateQuoteProvider.notifier)
                      .updateFavorite(quote)
                      .then((value) async {
                    await SharedHelpers.displaySnackbar(
                      ctx,
                      _addOrRemovefavMessage(ctx),
                      true,
                    );
                  });
                },
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
              QuoteCardButton(
                child: FaIcon(
                  FontAwesomeIcons.download,
                  size: Dimensions.iconSizeSmallest,
                  color: iconsColor,
                ),
                onPressed: () async {
                  await ref
                      .read(saveQuoteProvider.notifier)
                      .captureQuoteWidgetAsImage(widgetKey)
                      .then((value) async {
                    await SharedHelpers.displaySnackbar(
                      ctx,
                      l10n.image_saved,
                      true,
                    );
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String _addOrRemovefavMessage(BuildContext context) {
    final l10n = context.l10n;
    return quote.isFavorite == 1
        ? l10n.quote_removed_from_fav
        : l10n.quote_added_to_fav;
  }
}
