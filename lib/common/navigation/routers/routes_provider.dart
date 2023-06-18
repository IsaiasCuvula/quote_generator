import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/auth/auth.dart';

final navigationKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>(
  (ref) {
    final authState = ref.watch(authStateChangesProvider);

    return GoRouter(
      initialLocation: RouteLocation.splash,
      navigatorKey: navigationKey,
      routes: routes,
      errorBuilder: (context, state) => const ErrorScreen(),
      redirect: (context, state) {
        if (authState.isLoading || authState.hasError) return null;
        final isAuth = authState.valueOrNull != null;
        final isSplash = state.location == RouteLocation.splash;
        if (isSplash) {
          return isAuth ? RouteLocation.createdByYou : RouteLocation.auth;
        }
        final isLoggedIn = state.location == RouteLocation.auth;
        if (isLoggedIn) return isAuth ? RouteLocation.createdByYou : null;
        return isAuth ? null : RouteLocation.splash;
      },
    );
  },
);
