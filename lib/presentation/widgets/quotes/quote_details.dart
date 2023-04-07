import 'package:flutter/material.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/data/data.dart';
import 'package:quote_generator/utils/utils.dart';

class QuoteDetails extends StatelessWidget {
  const QuoteDetails({
    super.key,
    required this.quote,
  });

  final QuoteModel quote;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(quote.backgroundColor),
      child: Center(
        child: Padding(
          padding: Dimensions.kPaddingAllMedium,
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  quote.text,
                  textAlign: Helpers.textAlignList[quote.textAlign],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: quote.fontSize,
                    fontWeight: Helpers.fontWeightList[quote.fontWeight],
                    wordSpacing: quote.wordSpacing,
                    letterSpacing: quote.letterSpacing,
                  ),
                ),
                Dimensions.kVerticalSpaceSmall,
                Text(
                  '- ${quote.author}',
                  textAlign: Helpers.textAlignList[quote.textAlign],
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 32),
                IconButton(
                  icon: Icon(
                    quote.isFavorite == 1
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  color: Colors.red,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
