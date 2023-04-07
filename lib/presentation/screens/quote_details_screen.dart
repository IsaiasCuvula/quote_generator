import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/presentation/presentation.dart';
import 'package:quote_generator/translations/translations.dart';
import 'package:quote_generator/utils/utils.dart';

class QuoteCardDetails extends StatelessWidget {
  static QuoteCardDetails builder(
    BuildContext context,
    GoRouterState state,
    String? id,
  ) =>
      QuoteCardDetails(id: id);
  const QuoteCardDetails({
    super.key,
    this.id,
  });

  final String? id;

  @override
  Widget build(BuildContext context) {
    final quoteId = Helpers.stringToInt('$id');

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (ctx, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              pinned: true,
              centerTitle: false,
              title: Padding(
                padding: Dimensions.kPaddingAllLarge,
                child: Text(
                  context.l10n.app_bar_quote_details,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              actions: [
                Padding(
                  padding: Dimensions.kPaddingSymetricHorizontal,
                  child: IconButton(
                    onPressed: () {
                      //delete quote
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.trash,
                    ),
                  ),
                ),
              ],
            )
          ];
        },
        body: Consumer(
          builder: (ctx, ref, child) {
            return ref.watch(quoteByIdProvider(quoteId)).when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => Center(
                    child: Text(
                      'The quote with $id id do not exist. $error',
                    ),
                  ),
                  data: (quote) {
                    return quote != null
                        ? QuoteDetails(quote: quote)
                        : const SizedBox();
                  },
                );
          },
        ),
      ),
    );
  }
}
