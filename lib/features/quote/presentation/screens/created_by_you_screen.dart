import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/shared/shared.dart';

class CreateByYouScreen extends StatelessWidget {
  static CreateByYouScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateByYouScreen();

  const CreateByYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyAndAppBarNestedScrollView(
        appBarTitle: context.l10n.app_bar_create_by_you,
        actions: [
          IconButton(
            onPressed: () => context.push('/settings'),
            icon: const FaIcon(FontAwesomeIcons.gear),
          ),
          Padding(
            padding: Dimensions.kPaddingHorizontalSmall,
            child: IconButton(
              onPressed: () => context.push('/createQuote'),
              icon: const FaIcon(
                FontAwesomeIcons.plus,
              ),
            ),
          ),
        ],
        body: Consumer(
          builder: ((context, ref, child) {
            final quoteState = ref.watch(quoteProvider);
            final quotes = quoteState.allQuotes;
            return quotes.isEmpty
                ? Center(
                    child: Padding(
                      padding: Dimensions.kPaddingAllLarge,
                      child: EmptyQuoteCard(
                        displayIcon: FontAwesomeIcons.list,
                        displayText: context.l10n.empty_card_created_by_you,
                      ),
                    ),
                  )
                : ListOfQuotes(
                    key: const Key('CreatedByYouScreen'),
                    quotes: quotes,
                  );
          }),
        ),
      ),
    );
  }
}
