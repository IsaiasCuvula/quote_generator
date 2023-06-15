import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/common/navigation/navigation.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/quote/quote.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routes = [
  GoRoute(
    path: RoutesName.createQuote,
    parentNavigatorKey: RoutesConfig.navigationKey,
    pageBuilder: (context, state) {
      return NoTransitionPage(
        child: CreateQuoteScreen.builder(context, state),
      );
    },
  ),
  GoRoute(
    name: RoutesName.detailScreen,
    path: '${RoutesName.detailScreen}/:id',
    parentNavigatorKey: RoutesConfig.navigationKey,
    pageBuilder: (context, state) {
      return NoTransitionPage(
        child: QuoteCardDetails.builder(
          context,
          state,
          state.params['id'],
        ),
      );
    },
  ),
  GoRoute(
    path: RoutesName.settings,
    parentNavigatorKey: RoutesConfig.navigationKey,
    pageBuilder: (context, state) {
      return NoTransitionPage(
        child: SettingsScreen.builder(context, state),
      );
    },
  ),
  //Bottom Nav bar shell
  ShellRoute(
    navigatorKey: _shellNavigatorKey,
    pageBuilder: (context, state, child) {
      return NoTransitionPage(
        child: BottomNavBarShell.builder(
          context,
          state,
          child,
        ),
      );
    },
    routes: [
      GoRoute(
        path: RoutesName.createByYou,
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: CreateByYouScreen.builder(context, state),
          );
        },
      ),
      GoRoute(
        path: RoutesName.discovery,
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: DiscoveryScreen.builder(context, state),
          );
        },
      ),
      GoRoute(
        path: RoutesName.search,
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: SearchScreen.builder(context, state),
          );
        },
      ),
      GoRoute(
        path: RoutesName.favorites,
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: FavoriteScreen.builder(context, state),
          );
        },
      ),
    ],
  ),
];
