import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/presentation/presentation.dart';
import 'package:quote_generator/translations/translations.dart';
import 'package:quote_generator/utils/utils.dart';

class QuoteCardDetails extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final quoteId = Helpers.stringToInt('$id');
    final quote = ref.watch(quoteProvider).quote;

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
                    onPressed: () async {
                      await Helpers.showAlertDialog(
                        context: context,
                        ref: ref,
                        quoteId: quoteId,
                      );
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
        body: quote != null ? QuoteDetails(quote: quote) : const SizedBox(),
      ),
    );
  }
}
