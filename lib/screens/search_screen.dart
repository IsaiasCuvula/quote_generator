import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatelessWidget {
  static SearchScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SearchScreen();

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Quote'),
      ),
    );
  }
}
