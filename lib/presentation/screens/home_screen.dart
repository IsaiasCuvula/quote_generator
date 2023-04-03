import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/presentation/theme/theme.dart';
import 'package:quote_generator/translations/translations.dart';
import 'package:quote_generator/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();

  const HomeScreen({super.key});

  static const items = <QuoteCard>[];

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
                  style: theme.textTheme.displayMedium,
                ),
              ),
            )
          ];
        },
        body: const ListOfQuotes(
          key: Key('HomeScreen'),
          items: items,
        ),
      ),
    );
  }
}
