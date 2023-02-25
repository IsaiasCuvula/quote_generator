import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/models/models.dart';
import 'package:quote_generator/widgets/widgets.dart';

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
      body: ListOfQuotes(items: QuoteModel.items),
    );
  }
}
