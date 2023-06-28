import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/common/l10n/l10n.dart';

class AuthorTextField extends StatelessWidget {
  const AuthorTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hintColor = theme.colorScheme.onBackground;
    return SizedBox(
      height: Dimensions.kAuthorTextFieldSize,
      child: Consumer(builder: (ctx, ref, child) {
        return TextField(
          decoration: InputDecoration.collapsed(
            hintText: context.l10n.quoteAuhtor,
            hintStyle: theme.textTheme.bodySmall?.copyWith(
              color: hintColor,
            ),
            border: OutlineInputBorder(
              borderRadius: Dimensions.kBorderRadiusAllLarge,
              borderSide: BorderSide.none,
            ),
          ),
          style: theme.textTheme.bodySmall?.copyWith(
            color: hintColor,
          ),
          onChanged: (author) {
            ref.read(textSettingsProvider.notifier).setQuoteAuthor(
                  author.trim(),
                );
          },
        );
      }),
    );
  }
}
