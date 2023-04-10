import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/data/data.dart';
import 'package:quote_generator/presentation/presentation.dart';
import 'package:quote_generator/translations/l10n.dart';
import 'package:quote_generator/utils/utils.dart';
import 'package:share_plus/share_plus.dart';

class QuoteDetails extends ConsumerWidget {
  const QuoteDetails({
    super.key,
    required this.quote,
  });

  final QuoteModel quote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.surface;
    final displFavoriteIcon = quote.isFavorite == 1
        ? FontAwesomeIcons.solidHeart
        : FontAwesomeIcons.heart;

    return Container(
      margin: Dimensions.kPaddingAllLarge,
      decoration: BoxDecoration(
        color: Color(quote.backgroundColor),
        borderRadius: Dimensions.kBorderRadiusAllLarge,
      ),
      child: Center(
        child: Padding(
          padding: Dimensions.kPaddingAllLarge,
          child: IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  quote.text,
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
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: textColor,
                  ),
                ),
                Dimensions.kVerticalSpaceLarge,
                Consumer(builder: (context, ref, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          displFavoriteIcon,
                          size: Dimensions.iconSizeLarge,
                        ),
                        color: textColor,
                        onPressed: () async {
                          await ref
                              .read(quoteProvider.notifier)
                              .updateFavorite(quote)
                              .then((value) {
                            _showSnackBar(context);
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.share,
                          size: Dimensions.iconSizeLarge,
                        ),
                        color: textColor,
                        onPressed: () {
                          final text = quote.text;
                          final author = quote.author;
                          _shareQuote(text, author);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.rss,
                          size: Dimensions.iconSizeLarge,
                        ),
                        color: textColor,
                        onPressed: () {
                          //post a quote
                        },
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    String msg = '';
    final bool isfavorite = quote.isFavorite == 0 ? false : true;
    if (isfavorite) {
      msg = context.l10n.quote_removed_from_fav;
    } else {
      msg = context.l10n.quote_added_to_fav;
    }
    Helpers.showSnackbar(
      context,
      msg,
      true,
    );
  }

  void _shareQuote(String quote, String author) async {
    await Share.share('${quote.trim()} \n\n- $author');
  }
}
