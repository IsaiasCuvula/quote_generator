import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/presentation/presentation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/translations/translations.dart';
import 'package:quote_generator/config/config.dart';

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
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              actions: [
                Padding(
                  padding: Dimensions.kPaddingSymetricHorizontal,
                  child: IconButton(
                    onPressed: () => context.push('/createQuote'),
                    icon: const FaIcon(
                      FontAwesomeIcons.plus,
                    ),
                  ),
                ),
              ],
            )
          ];
        },
        body: Consumer(
          builder: ((context, ref, child) {
            final quotes = ref.watch(quoteProvider);
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
