import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/translations/l10n.dart';
import 'package:quote_generator/presentation/presentation.dart';

class FavoriteScreen extends StatelessWidget {
  static FavoriteScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const FavoriteScreen();

  const FavoriteScreen({super.key});
  static const itemsFav = <QuoteCard>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: itemsFav.isEmpty
          ? Center(
              child: Padding(
                padding: Dimensions.kPaddingAllLarge,
                child: EmptyQuoteCard(
                  displayIcon: FontAwesomeIcons.heart,
                  displayText: context.l10n.empty_card_favorite_quote,
                ),
              ),
            )
          : const ListOfQuotes(
              key: Key('FavoriteScreen'),
              items: itemsFav,
            ),
    );
  }
}