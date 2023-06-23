import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/shared/shared.dart';
import 'package:share_plus/share_plus.dart';

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
        await shareQuote(quoteText, quoteAuthor);
      },
    );
  }

  Future<void> shareQuote(String quoteDescription, String author) async {
    await Share.share('${quoteDescription.trim()} \n\n- $author');
  }
}
