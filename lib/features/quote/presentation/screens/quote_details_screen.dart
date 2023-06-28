import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/common/l10n/l10n.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

class QuoteDetailScreen extends ConsumerWidget {
  static QuoteDetailScreen builder(
    BuildContext context,
    GoRouterState state,
    String? id,
  ) =>
      QuoteDetailScreen(id: id);
  const QuoteDetailScreen({
    Key? key,
    this.id,
  }) : super(key: key);

  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(Duration.zero, () {
      _getQuoteById(ref);
    });
    final quote = ref.watch(getQuoteByIdProvider).quote;
    return Scaffold(
      body: BodyAndAppBarNestedScrollView(
        appBarTitle: context.l10n.appBarQuoteDetails,
        centerTitle: true,
        body: quote != null ? QuoteDetailBody(quote: quote) : const SizedBox(),
      ),
    );
  }

  void _getQuoteById(WidgetRef ref) async {
    final int quoteId = Helpers.stringToInt('$id');
    await ref.read(getQuoteByIdProvider.notifier).getQuoteById(quoteId);
  }
}
