import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/common/common.dart';
import 'package:flutter/services.dart';
import 'package:quote_generator/features/shared/shared.dart';

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
          await SharedHelpers.displaySnackbar(
            context,
            context.l10n.copied_to_clipboard,
            true,
          );
        });
      },
    );
  }
}
