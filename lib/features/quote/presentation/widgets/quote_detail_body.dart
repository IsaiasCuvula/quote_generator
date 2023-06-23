import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';
import 'package:quote_generator/common/common.dart';

class QuoteDetailBody extends ConsumerWidget {
  const QuoteDetailBody({
    super.key,
    required this.quote,
  });

  final Quote quote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textColor = context.colorScheme.onSurface;
    final l10n = context.l10n;
    final displayFavoriteIcon = quote.isFavorite == 1
        ? FontAwesomeIcons.solidHeart
        : FontAwesomeIcons.heart;

    return Container(
      margin: Dimensions.kPaddingAllLarge,
      padding: Dimensions.kPaddingAllLarge,
      decoration: BoxDecoration(
        color: Color(quote.backgroundColor),
        borderRadius: Dimensions.kBorderRadiusAllLarge,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.quoteLeft,
            size: Dimensions.iconSizeLarge,
            color: textColor,
          ),
          Dimensions.kVerticalSpaceSmall,
          Text(
            quote.quoteText,
            textAlign: Helpers.textAlignList[quote.textAlign],
            style: TextStyle(
              color: textColor,
              fontSize: quote.fontSize,
              fontWeight: Helpers.fontWeightList[quote.fontWeight],
              wordSpacing: quote.wordSpacing,
              letterSpacing: quote.letterSpacing,
            ),
          ),
          Dimensions.kVerticalSpaceSmall,
          Text(
            '- ${quote.author}',
            textAlign: Helpers.textAlignList[quote.textAlign],
            style: context.textTheme.bodyMedium?.copyWith(
              color: textColor,
            ),
          ),
          Dimensions.kVerticalSpaceLarge,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  displayFavoriteIcon,
                  size: Dimensions.iconSizeLarge,
                ),
                color: textColor,
                onPressed: () async {
                  await ref
                      .read(updateQuoteProvider.notifier)
                      .updateFavorite(quote)
                      .then((value) {
                    _showSnackBar(context);
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.shareNodes,
                  size: Dimensions.iconSizeLarge,
                ),
                color: textColor,
                onPressed: () async {
                  final quoteText = quote.quoteText;
                  final quoteAuthor = quote.author;
                  await SharedHelpers.shareQuote(
                    quoteText,
                    quoteAuthor,
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.rss,
                  size: Dimensions.iconSizeLarge,
                ),
                color: textColor,
                onPressed: () async {
                  ref.read(postQuoteProvider.call(quote)).when(
                        data: (result) {
                          return SharedHelpers.displaySnackbar(
                            context,
                            l10n.quote_posted_successfully,
                            false,
                          );
                        },
                        error: (error, trace) {
                          return SharedHelpers.displaySnackbar(
                            context,
                            l10n.something_went_wrong,
                            false,
                          );
                        },
                        loading: () => const LoadingScreen(),
                      );
                },
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.trashCan,
                  size: Dimensions.iconSizeLarge,
                ),
                color: textColor,
                onPressed: () async {
                  final quoteId = Helpers.stringToInt('${quote.id}');
                  await Helpers.showAlertDeleteDialog(
                    context: context,
                    ref: ref,
                    quoteId: quoteId,
                  );
                },
              ),
            ],
          ),
        ].animate().slide().then().shake(),
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    final l10n = context.l10n;
    final String msg = quote.isFavorite == 1
        ? l10n.quote_removed_from_fav
        : l10n.quote_added_to_fav;

    SharedHelpers.displaySnackbar(context, msg, true);
  }
}
