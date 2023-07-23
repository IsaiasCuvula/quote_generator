import 'package:flutter/material.dart';
import 'package:quote_generator/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/features/features.dart';

class DownloadButton extends ConsumerWidget {
  const DownloadButton({
    required this.widgetKey,
    Key? key,
  }) : super(key: key);

  final GlobalKey widgetKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return QuoteCardButton(
      child: FaIcon(
        FontAwesomeIcons.download,
        size: Dimensions.iconSizeSmallest,
        color: context.colorScheme.primary,
      ),
      onPressed: () async {
        await ref
            .read(saveQuoteProvider.notifier)
            .captureQuoteWidgetAsImage(widgetKey)
            .then(
          (value) async {
            await AppAlerts.displaySnackbar(
              context,
              context.l10n.imageSaved,
              true,
            );
          },
        );
      },
    );
  }
}
