import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/shared/shared.dart';
import 'package:quote_generator/features/shared/widgets/display_message_card.dart';

class SaveToFavoriteButton extends ConsumerWidget {
  const SaveToFavoriteButton({super.key, required this.quote});

  final RemoteQuote quote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(hasFavoritedQuoteProvider(quote));

    return isFavorite.when(
      data: (isFavorite) {
        final displayFavIcon =
            isFavorite ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart;

        return QuoteCardButton(
          child: FaIcon(
            displayFavIcon,
            size: Dimensions.iconSizeSmallest,
            color: context.colorScheme.primary,
          ),
          onPressed: () async {
            ref.read(
              favoriteAndUnforiteQuoteProvider(quote.quoteId),
            );
            if (context.mounted) {
              await SharedHelpers.displaySnackbar(
                context,
                _addOrRemovefavMessage(
                  context,
                  isFavorite,
                ),
                true,
              );
            }
          },
        );
      },
      error: ((error, stackTrace) => DisplayErrorMessage(
            message: error.toString(),
          )),
      loading: () => const LoadingScreen(),
    );
  }

  String _addOrRemovefavMessage(BuildContext context, bool isFavorite) {
    final l10n = context.l10n;
    return isFavorite ? l10n.quote_removed_from_fav : l10n.quote_added_to_fav;
  }
}
