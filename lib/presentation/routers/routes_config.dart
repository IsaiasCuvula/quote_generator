import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/presentation/routers/routes.dart';

@immutable
class RoutesConfig {
  static final _navigationKey = GlobalKey<NavigatorState>();
  static final routeConfig = GoRouter(
    initialLocation: '/home',
    navigatorKey: _navigationKey,
    routes: routes,
  );
}
