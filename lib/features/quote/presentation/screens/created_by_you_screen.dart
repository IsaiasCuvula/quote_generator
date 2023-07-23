import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/core/core.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/features/features.dart';

class CreatedByYouScreen extends ConsumerWidget {
  static CreatedByYouScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreatedByYouScreen();

  const CreatedByYouScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final user = ref.watch(userProvider).appUser;
    final quoteState = ref.watch(getQuotesProvider);
    final quotes = quoteState.allQuotes;
    final isLoading = quoteState.isLoading;
    final message = quoteState.message;

    return Scaffold(
      body: BodyAndAppBarNestedScrollView(
        appBarTitle: l10n.appBarCreateByYou,
        actions: [
          IconButton(
            onPressed: () => context.push(RouteLocation.createQuote),
            icon: const FaIcon(
              FontAwesomeIcons.plus,
            ),
          ),
          Padding(
            padding: Dimensions.kPaddingHorizontalSmall,
            child: IconButton(
              onPressed: () => context.push(RouteLocation.profile),
              icon: user?.profileImage == null
                  ? const FaIcon(FontAwesomeIcons.user)
                  : DisplayUserImage(
                      radius: 14.0,
                      imageUrl: '${user?.profileImage}',
                    ),
            ),
          ),
        ],
        body: isLoading
            ? const LoadingScreen()
            : message.isNotEmpty
                ? DisplayErrorMessage(message: message)
                : quotes.isEmpty
                    ? Center(
                        child: Padding(
                          padding: Dimensions.kPaddingAllLarge,
                          child: EmptyQuoteCard(
                            displayIcon: FontAwesomeIcons.list,
                            displayText: l10n.emptyCardCreatedByYou,
                          ),
                        ),
                      )
                    : ListOfQuotes(quotes: quotes),
      ),
    );
  }
}
