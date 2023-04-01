import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/data/models/models.dart';
import 'package:quote_generator/presentation/widgets/widgets.dart';

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
      body: ListOfQuotes(
        key: Key('LatestQuoteScreen'),
        items: QuoteModel.items,
      ),
    );
  }
}
