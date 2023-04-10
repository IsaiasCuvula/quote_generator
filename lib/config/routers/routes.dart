import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/config/routers/routes_config.dart';
import 'package:quote_generator/presentation/screens/screens.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routes = [
  GoRoute(
    path: '/createQuote',
    parentNavigatorKey: RoutesConfig.navigationKey,
    pageBuilder: (context, state) {
      return NoTransitionPage(
        child: CreateQuoteScreen.builder(context, state),
      );
    },
  ),
  GoRoute(
    name: '/quoteDetails',
    path: '/quoteDetails/:id',
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
        path: '/',
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: HomeScreen.builder(context, state),
          );
        },
      ),
      GoRoute(
        path: '/createdByYou',
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: CreateByYouScreen.builder(context, state),
          );
        },
      ),
      GoRoute(
        path: '/search',
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: SearchScreen.builder(context, state),
          );
        },
      ),
      GoRoute(
        path: '/favorites',
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
