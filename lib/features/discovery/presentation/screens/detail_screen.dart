import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/features/features.dart';
import 'package:quote_generator/core/core.dart';

class RemoteQuoteDetailScreen extends ConsumerWidget {
  static RemoteQuoteDetailScreen builder(
    BuildContext context,
    GoRouterState state,
    String quoteId,
  ) =>
      RemoteQuoteDetailScreen(quoteId: quoteId);
  const RemoteQuoteDetailScreen({Key? key, required this.quoteId})
      : super(key: key);

  final String quoteId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remoteQuote = ref.watch(getRemoteQuoteByIdProvider(quoteId));
    return Scaffold(
      body: BodyAndAppBarNestedScrollView(
          appBarTitle: context.l10n.appBarQuoteDetails,
          centerTitle: true,
          body: remoteQuote.when(
            data: (quote) => DetailBody(quote: quote),
            error: (error, traceTranck) => DisplayErrorMessage(
              message: error.toString(),
            ),
            loading: () => const LoadingScreen(),
          )),
    );
  }
}
