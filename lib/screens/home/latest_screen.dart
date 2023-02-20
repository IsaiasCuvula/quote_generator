import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LatestScreen extends StatelessWidget {
  static LatestScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const LatestScreen();

  const LatestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Latest Screen'),
      ),
    );
  }
}
