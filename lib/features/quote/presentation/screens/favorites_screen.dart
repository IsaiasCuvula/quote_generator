import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/core/core.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/features/features.dart';

class FavoriteScreen extends ConsumerWidget {
  static FavoriteScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const FavoriteScreen();

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final quoteState = ref.watch(getFavoritesQuotesProvider);
    final favoritesQuotes = quoteState.favoritesQuotes;
    final isLoading = quoteState.isLoading;
    final message = quoteState.message;

    return Scaffold(
      body: BodyAndAppBarNestedScrollView(
        appBarTitle: l10n.appBarFavorite,
        centerTitle: true,
        body: isLoading
            ? const LoadingScreen()
            : message.isNotEmpty
                ? DisplayErrorMessage(message: message)
                : favoritesQuotes.isEmpty
                    ? Center(
                        child: Padding(
                          padding: Dimensions.kPaddingAllLarge,
                          child: EmptyQuoteCard(
                            displayIcon: FontAwesomeIcons.solidHeart,
                            displayText: l10n.emptyCardFavoriteQuote,
                          ),
                        ),
                      )
                    : ListOfQuotes(quotes: favoritesQuotes),
      ),
    );
  }
}
