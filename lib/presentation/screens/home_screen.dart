import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/config/theme/theme.dart';
import 'package:quote_generator/translations/translations.dart';
import 'package:quote_generator/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();

  const HomeScreen({super.key});

  static const items = [];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final tabLabelTextStyle = theme.textTheme.bodyMedium;

    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (ctx, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                centerTitle: true,
                title: Padding(
                  padding: Dimensions.kPaddingAllLarge,
                  child: Text(
                    context.l10n.explore,
                    style: theme.textTheme.headlineLarge,
                  ),
                ),
              )
            ];
          },
          body: EmptyQuoteCard(
            displayIcon: FontAwesomeIcons.quoteLeft,
            displayText: context.l10n.empty_card_created_by_you,
          )

          // const ListOfQuotes(
          //   key: Key('HomeScreen'),
          //   items: items,
          // ),
          ),
    );
  }
}
