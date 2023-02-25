import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/models/models.dart';
import 'package:quote_generator/widgets/widgets.dart';

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
      body: ListOfQuotes(items: QuoteModel.items),
    );
  }
}
