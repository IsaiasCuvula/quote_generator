import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:quote_generator/core/core.dart';
import 'package:quote_generator/config/config.dart';

class CopyToClipboardButton extends ConsumerWidget {
  const CopyToClipboardButton({
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
        FontAwesomeIcons.copy,
        size: Dimensions.iconSizeSmallest,
        color: context.colorScheme.primary,
      ),
      onPressed: () async {
        await Clipboard.setData(
          ClipboardData(
            text: '$quoteText\n$quoteAuthor',
          ),
        ).then((value) async {
          await AppAlerts.displaySnackbar(
            context,
            context.l10n.copiedToClipboard,
            true,
          );
        });
      },
    );
  }
}
