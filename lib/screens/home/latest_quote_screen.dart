import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LatestQuoteScreen extends StatelessWidget {
  static LatestQuoteScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const LatestQuoteScreen();

  const LatestQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Latest Screen'),
      ),
    );
  }
}
