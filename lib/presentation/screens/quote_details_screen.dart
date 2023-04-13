import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/presentation/presentation.dart';
import 'package:quote_generator/translations/translations.dart';

class QuoteCardDetails extends ConsumerWidget {
  static QuoteCardDetails builder(
    BuildContext context,
    GoRouterState state,
    String? id,
  ) =>
      QuoteCardDetails(id: id);
  const QuoteCardDetails({
    Key? key,
    this.id,
  }) : super(key: key);

  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quote = ref.watch(quoteProvider).quote;

    return Scaffold(
      body: BodyAndAppBarNestedScrollView(
        appBarTitle: context.l10n.app_bar_quote_details,
        centerTitle: true,
        body: quote != null ? QuoteDetails(quote: quote) : const SizedBox(),
      ),
    );
  }
}
