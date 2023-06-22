import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

class SearchScreen extends ConsumerStatefulWidget {
  static SearchScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SearchScreen();

  const SearchScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quoteState = ref.watch(searchQuoteProvider);
    final quotes = quoteState.searcherdQuotes;

    return Scaffold(
      body: BodyAndAppBarNestedScrollView(
        appBarTitle: context.l10n.app_bar_search_quote,
        centerTitle: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchTextField(
              searchController: _searchController,
              onChanged: (text) => _searchQuote(text),
              onSubmitted: (text) => _searchQuote(text),
            ),
            Dimensions.kVerticalSpaceLarge,
            quotes.isEmpty
                ? const EmptySearchQuoteScreen()
                : Expanded(
                    child: ListOfQuotes(
                      key: const Key('SearchQuote'),
                      quotes: quotes,
                    ),
                  )
          ],
        ),
      ),
    );
  }

  void _searchQuote(String text) async {
    final query = text.trim();
    if (query.isNotEmpty) {
      await ref.watch(searchQuoteProvider.notifier).searchQuote(query);
    } else {
      ref.read(searchQuoteProvider.notifier).clearSearchedQuotesEvent();
    }
  }
}
