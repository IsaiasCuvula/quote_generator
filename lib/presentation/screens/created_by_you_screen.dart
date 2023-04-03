import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/presentation/presentation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/translations/translations.dart';

class CreateByYouScreen extends StatelessWidget {
  static CreateByYouScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateByYouScreen();

  const CreateByYouScreen({super.key});
  static const List<QuoteCard> itemsFav = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (ctx, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              pinned: true,
              centerTitle: false,
              title: Padding(
                padding: Dimensions.kPaddingAllLarge,
                child: Text(
                  context.l10n.app_bar_create_by_you,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              actions: [
                Padding(
                  padding: Dimensions.kPaddingSymetricHorizontal,
                  child: IconButton(
                    onPressed: () => context.go('/createQuote'),
                    icon: const FaIcon(
                      FontAwesomeIcons.plus,
                    ),
                  ),
                ),
              ],
            )
          ];
        },
        body: itemsFav.isEmpty
            ? Center(
                child: Padding(
                  padding: Dimensions.kPaddingAllLarge,
                  child: EmptyQuoteCard(
                    displayIcon: FontAwesomeIcons.list,
                    displayText: context.l10n.empty_card_created_by_you,
                  ),
                ),
              )
            : const ListOfQuotes(
                key: Key('CreatedByYouScreen'),
                items: itemsFav,
              ),
      ),
    );
  }
}
