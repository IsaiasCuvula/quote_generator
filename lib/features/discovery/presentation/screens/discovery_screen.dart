import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/shared/shared.dart';

class DiscoveryScreen extends StatelessWidget {
  static DiscoveryScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const DiscoveryScreen();

  const DiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: BodyAndAppBarNestedScrollView(
        appBarTitle: l10n.explore,
        centerTitle: true,
        //TODO - waiting to load all posted quotes from server
        body: Center(
          child: Padding(
            padding: Dimensions.kPaddingAllLarge,
            child: EmptyQuoteCard(
              displayIcon: FontAwesomeIcons.quoteLeft,
              displayText: l10n.empty_card_discovery,
            ),
          ),
        ),
      ),
    );
  }
}
