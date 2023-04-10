import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/config/theme/theme.dart';
import 'package:quote_generator/data/data.dart';
import 'package:quote_generator/presentation/presentation.dart';

class ListOfQuotes extends StatelessWidget {
  const ListOfQuotes({
    Key? key,
    required this.quotes,
  }) : super(key: key);

  final QuoteList quotes;

  @override
  Widget build(BuildContext context) {
    int axisCount = quotes.length == 1 ? 1 : 2;
    return Column(
      children: [
        Expanded(
          child: MasonryGridView.count(
            padding: Dimensions.kPaddingAllLarge,
            crossAxisCount: axisCount,
            mainAxisSpacing: Dimensions.sizeSmall,
            crossAxisSpacing: Dimensions.sizeSmall,
            itemCount: quotes.length,
            itemBuilder: (context, index) {
              final quote = quotes[index];
              return Consumer(builder: (ctx, ref, child) {
                return InkWell(
                  borderRadius: Dimensions.kBorderRadiusAllLarge,
                  onTap: () async {
                    await ref
                        .read(quoteProvider.notifier)
                        .getQuoteById(quote.id!)
                        .then((value) {
                      context.pushNamed(
                        '/quoteDetails',
                        params: {'id': '${quote.id}'},
                      );
                    });
                  },
                  child: QuoteCard(quote: quote),
                );
              });
            },
          ),
        ),
        Dimensions.kVerticalSpaceLargest,
      ],
    );
  }
}
