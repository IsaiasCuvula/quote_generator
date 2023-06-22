import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({
    super.key,
    required this.quote,
    required this.selectedIconColor,
  });

  final Quote quote;
  final Color selectedIconColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayFavoriteIcon = quote.isFavorite == 1
        ? FontAwesomeIcons.solidHeart
        : FontAwesomeIcons.heart;
    return QuoteCardButton(
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
            context,
            _addOrRemovefavMessage(context),
            true,
          );
        });
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
