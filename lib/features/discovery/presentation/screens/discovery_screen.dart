import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/features/features.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/core/core.dart';

class DiscoveryScreen extends ConsumerWidget {
  static DiscoveryScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const DiscoveryScreen();

  const DiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final allQuotes = ref.watch(allQuotesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.explore,
          style: context.textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          // ignore: unused_result
          ref.refresh(allQuotesProvider);
          return Future.delayed(
            const Duration(
              seconds: 1,
            ),
          );
        },
        child: allQuotes.when(
          data: (quotes) {
            if (quotes.isEmpty) {
              return Center(
                child: Padding(
                  padding: Dimensions.kPaddingAllLarge,
                  child: EmptyQuoteCard(
                    displayIcon: FontAwesomeIcons.quoteLeft,
                    displayText: l10n.emptyCardDiscovery,
                  ),
                ),
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: Dimensions.kPaddingAllLarge,
                      itemCount: quotes.length,
                      itemBuilder: (context, index) {
                        final quote = quotes.toList()[index];
                        return RemoteQuoteCard(quote: quote);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Dimensions.kVerticalSpaceSmaller;
                      },
                    ),
                  ),
                  Dimensions.kVerticalSpaceLargest,
                ],
              );
            }
          },
          error: (error, stackTrace) => DisplayErrorMessage(
            message: '$error',
          ),
          loading: () => const LoadingScreen(),
        ),
      ),
    );
  }
}
