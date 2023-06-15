import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/shared/util/shared_helpers.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key, required this.quote});

  final Quote quote;

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

    final displayFavoriteIcon = quote.isFavorite == 1
        ? FontAwesomeIcons.solidHeart
        : FontAwesomeIcons.heart;
    final unSelectedIconColor = colorScheme.onPrimary;
    final selectedIconColor = colorScheme.onPrimary;
    final iconsColor =
        quote.isFavorite == 1 ? selectedIconColor : unSelectedIconColor;

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
          Consumer(
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
                            ctx.l10n.copied_to_clipboard,
                            true,
                          );
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String _addOrRemovefavMessage(BuildContext context) {
    final l10n = context.l10n;
    return quote.isFavorite == 1
        ? l10n.quote_removed_from_fav
        : l10n.quote_added_to_fav;
  }
}
