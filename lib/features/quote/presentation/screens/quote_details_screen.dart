import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

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
    Future.delayed(Duration.zero, () {
      _getQuoteById(ref);
    });
    final quote = ref.watch(getQuoteByIdProvider).quote;
    return Scaffold(
      body: BodyAndAppBarNestedScrollView(
        appBarTitle: context.l10n.app_bar_quote_details,
        centerTitle: true,
        body: quote != null ? QuoteDetails(quote: quote) : const SizedBox(),
      ),
    );
  }

  void _getQuoteById(WidgetRef ref) async {
    final int quoteId = Helpers.stringToInt('$id');
    await ref.read(getQuoteByIdProvider.notifier).getQuoteById(quoteId);
  }
}
