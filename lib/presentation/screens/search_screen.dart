import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/config/theme/dimensions.dart';
import 'package:quote_generator/presentation/presentation.dart';
import 'package:quote_generator/translations/translations.dart';

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
    final theme = Theme.of(context);
    final quoteState = ref.watch(quoteProvider);
    final quotes = quoteState.searcherdQuotes;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: NestedScrollView(
          headerSliverBuilder: (ctx, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                centerTitle: true,
                title: Padding(
                  padding: Dimensions.kPaddingAllLarge,
                  child: Text(
                    context.l10n.app_bar_search_quote,
                    style: theme.textTheme.headlineLarge,
                  ),
                ),
              )
            ];
          },
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
      ),
    );
  }

  void _searchQuote(String text) async {
    final query = text.trim();
    if (query.isNotEmpty) {
      await ref.read(quoteProvider.notifier).searchQuote(query);
    } else {
      ref.read(quoteProvider.notifier).clearSearchedQuotesEvent();
    }
  }
}
