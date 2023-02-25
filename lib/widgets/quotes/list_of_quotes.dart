import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:quote_generator/theme/theme.dart';
import 'quotes.dart';

class ListOfQuotes extends StatelessWidget {
  const ListOfQuotes({super.key, required this.items});

  final List<QuoteCard> items;

  @override
  Widget build(BuildContext context) {
    int axisCount = items.length == 1 ? 1 : 2;
    return MasonryGridView.count(
      padding: Dimensions.kPaddingAllLarge,
      crossAxisCount: axisCount,
      mainAxisSpacing: Dimensions.sizeSmall,
      crossAxisSpacing: Dimensions.sizeSmall,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return item;
      },
    );
  }
}
