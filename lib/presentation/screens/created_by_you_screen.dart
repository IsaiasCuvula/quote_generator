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
    );
  }
}
