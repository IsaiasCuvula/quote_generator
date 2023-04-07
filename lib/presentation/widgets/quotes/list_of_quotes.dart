import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/config/theme/theme.dart';
import 'package:quote_generator/data/data.dart';
import 'quotes.dart';

class ListOfQuotes extends StatelessWidget {
  const ListOfQuotes({super.key, required this.quotes});

  final QuoteList quotes;

  @override
  Widget build(BuildContext context) {
    int axisCount = quotes.length == 1 ? 1 : 2;
    return MasonryGridView.count(
      padding: Dimensions.kPaddingAllLarge,
      crossAxisCount: axisCount,
      mainAxisSpacing: Dimensions.sizeSmall,
      crossAxisSpacing: Dimensions.sizeSmall,
      itemCount: quotes.length,
      itemBuilder: (context, index) {
        final quote = quotes[index];
        return InkWell(
          borderRadius: Dimensions.kBorderRadiusAllLarge,
          onTap: () {
            context.pushNamed(
              '/quoteDetails',
              params: {'id': '${quote.id}'},
            );
          },
          child: QuoteCard(quote: quote),
        );
      },
    );
  }
}
