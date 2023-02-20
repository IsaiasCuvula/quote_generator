import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreatedByYouScreen extends StatelessWidget {
  static CreatedByYouScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreatedByYouScreen();

  const CreatedByYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Created By You Screen'),
      ),
    );
  }
}
