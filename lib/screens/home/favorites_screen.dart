import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoriteScreen extends StatelessWidget {
  static FavoriteScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const FavoriteScreen();

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Favorite Screen '),
      ),
    );
  }
}
