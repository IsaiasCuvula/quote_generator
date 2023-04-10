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
    return Scaffold(
      body: NestedScrollView(
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
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SearchTextField(
                searchController: _searchController,
                onChanged: (text) {},
                onSubmitted: (text) {},
              ),
              Dimensions.kVerticalSpaceLarge,
              const EmptySearchQuoteScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
