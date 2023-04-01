import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/presentation/screens/screens.dart';
import 'package:quote_generator/presentation/theme/dimensions.dart';
import 'package:quote_generator/presentation/translations/l10n.dart';
import 'package:quote_generator/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tabLabelTextStyle = theme.textTheme.bodyMedium;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                    context.l10n.explore,
                    style: theme.textTheme.displayMedium,
                  ),
                ),
                bottom: TabBar(
                  physics: const AlwaysScrollableScrollPhysics(),
                  isScrollable: true,
                  labelStyle: tabLabelTextStyle,
                  unselectedLabelColor: theme.colorScheme.tertiaryContainer,
                  tabs: [
                    TabBarLabel(
                      label: context.l10n.tab_bar_create_by_you.toUpperCase(),
                    ),
                    TabBarLabel(
                      label: context.l10n.tab_bar_latest.toUpperCase(),
                    ),
                    TabBarLabel(
                      label: context.l10n.tab_bar_favorite.toUpperCase(),
                    ),
                  ],
                ),
              )
            ];
          },
          body: const TabBarView(
            children: [
              CreatedByYouScreen(),
              LatestQuoteScreen(),
              FavoriteScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
