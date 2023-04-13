import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/translations/l10n.dart';
import 'package:quote_generator/presentation/presentation.dart';

class FavoriteScreen extends ConsumerWidget {
  static FavoriteScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const FavoriteScreen();

  const FavoriteScreen({super.key});
  static const itemsFav = <QuoteCard>[];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesQuotes = ref.watch(quoteProvider).favoritesQuotes;
    return Scaffold(
      body: BodyAndAppBarNestedScrollView(
        appBarTitle: context.l10n.app_bar_favorite,
        centerTitle: true,
        body: favoritesQuotes.isEmpty
            ? Center(
                child: Padding(
                  padding: Dimensions.kPaddingAllLarge,
                  child: EmptyQuoteCard(
                    displayIcon: FontAwesomeIcons.solidHeart,
                    displayText: context.l10n.empty_card_favorite_quote,
                  ),
                ),
              )
            : ListOfQuotes(quotes: favoritesQuotes),
      ),
    );
  }
}
