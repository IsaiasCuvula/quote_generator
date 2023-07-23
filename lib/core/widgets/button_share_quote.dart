import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/core/core.dart';

class ShareQuoteButton extends ConsumerWidget {
  const ShareQuoteButton({
    super.key,
    required this.quoteText,
    required this.quoteAuthor,
  });

  final String quoteText;
  final String quoteAuthor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return QuoteCardButton(
      child: FaIcon(
        FontAwesomeIcons.shareNodes,
        size: Dimensions.iconSizeSmallest,
        color: context.colorScheme.primary,
      ),
      onPressed: () async {
        await AppHelpers.shareQuote(
          quoteText,
          quoteAuthor,
        );
      },
    );
  }
}
