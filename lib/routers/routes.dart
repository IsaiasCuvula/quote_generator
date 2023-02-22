import 'package:go_router/go_router.dart';
import 'package:quote_generator/screens/screens.dart';

final routes = [
  ShellRoute(
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
        path: '/home',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: HomeScreen.builder(context, state),
          );
        },
        routes: [
          GoRoute(
            path: 'favorites',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: FavoriteScreen.builder(context, state),
              );
            },
          ),
          GoRoute(
            path: 'latest',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: LatestQuoteScreen.builder(context, state),
              );
            },
          ),
          GoRoute(
            path: 'createdByYou',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: CreatedByYouScreen.builder(context, state),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/createQuote',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: CreateQuoteScreen.builder(context, state),
          );
        },
      ),
      GoRoute(
        path: '/search',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: SearchScreen.builder(context, state),
          );
        },
      ),
    ],
  )
];
