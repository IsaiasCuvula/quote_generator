import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/shared/shared.dart';
import 'package:quote_generator/features/shared/widgets/display_message_card.dart';

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
          appBarTitle: context.l10n.app_bar_quote_details,
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
