import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/presentation/routers/routes.dart';

@immutable
class RoutesConfig {
  static final navigationKey = GlobalKey<NavigatorState>();
  static final routeConfig = GoRouter(
    initialLocation: '/home',
    navigatorKey: navigationKey,
    routes: routes,
  );
}
