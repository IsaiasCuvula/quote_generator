import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/core/core.dart';

class LikeDislikeButton extends ConsumerWidget {
  const LikeDislikeButton({super.key, required this.quote});

  final RemoteQuote quote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLiked = ref.watch(hasLikedQuoteProvider(quote.quoteId));

    return isLiked.when(
      data: (isLiked) {
        final displayFavIcon =
            isLiked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart;

        return QuoteCardButton(
          child: FaIcon(
            displayFavIcon,
            size: Dimensions.iconSizeSmallest,
            color: context.colorScheme.primary,
          ),
          onPressed: () async {
            ref.read(
              likeDislikeQuoteProvider(
                quote.quoteId,
              ),
            );
          },
        );
      },
      error: ((error, stackTrace) => DisplayErrorMessage(
            message: error.toString(),
          )),
      loading: () => const LoadingScreen(),
    );
  }
}
