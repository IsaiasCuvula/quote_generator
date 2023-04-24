import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/presentation/presentation.dart';
import 'package:quote_generator/translations/translations.dart';

class DiscoveryScreen extends StatelessWidget {
  static DiscoveryScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const DiscoveryScreen();

  const DiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyAndAppBarNestedScrollView(
        appBarTitle: context.l10n.explore,
        centerTitle: true,
        //TODO - waiting to load all posted quotes from server
        body: Center(
          child: Padding(
            padding: Dimensions.kPaddingAllLarge,
            child: EmptyQuoteCard(
              displayIcon: FontAwesomeIcons.quoteLeft,
              displayText: context.l10n.empty_card_discovery,
            ),
          ),
        ),
      ),
    );
  }
}
