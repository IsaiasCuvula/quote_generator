import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared_helpers.dart';

class CreateQuoteScreen extends ConsumerWidget {
  static CreateQuoteScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateQuoteScreen();
  const CreateQuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final l10n = context.l10n;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: Dimensions.kPaddingHorizontalSmall,
              child: TextButton(
                onPressed: () async {
                  await _saveQuoteInDB(ref, context);
                },
                child: Text(
                  l10n.done.toUpperCase(),
                  style: textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: Dimensions.kPaddingHorizontalLarge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.create_your_quote,
                style: textTheme.displayMedium,
              ),
              const QuoteTextField(),
              const DisplayTextSettings(),
              const BackgroundColorPicker(),
              Dimensions.kVerticalSpaceLargest
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveQuoteInDB(WidgetRef ref, BuildContext ctx) async {
    final quoteText = ref.watch(textSettingsProvider).quoteText;
    final l10n = ctx.l10n;
    FocusManager.instance.primaryFocus?.unfocus();
    if (quoteText.trim().isNotEmpty) {
      await ref.read(quoteProvider.notifier).addQuote().then(
        (value) {
          ctx.pop();
          SharedHelpers.displaySnackbar(
            ctx,
            l10n.quote_created_successfully,
            true,
          );
        },
      );
    } else {
      SharedHelpers.displaySnackbar(
        ctx,
        '${l10n.empty_quote_alert}'
        '\n${l10n.enter_quote_to_save}',
        false,
      );
    }
  }
}
