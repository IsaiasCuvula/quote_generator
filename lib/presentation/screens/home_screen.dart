import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/presentation/presentation.dart';
import 'package:quote_generator/translations/translations.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyAndAppBarNestedScrollView(
        appBarTitle: context.l10n.explore,
        centerTitle: true,
        //TODO - waiting to load all posted quotes from server
        body: EmptyQuoteCard(
          displayIcon: FontAwesomeIcons.quoteLeft,
          displayText: context.l10n.empty_card_discovery,
        ),
      ),
    );
  }
}
