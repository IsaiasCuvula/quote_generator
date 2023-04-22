import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
    final textColor = theme.colorScheme.onSurface;
    final displFavoriteIcon = quote.isFavorite == 1
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
          Row(
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
                  //post a quote into the server
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
                  await Helpers.showAlertDialog(
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
