import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/features/quote/quote.dart';

class AuthorTextField extends StatelessWidget {
  const AuthorTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hintColor = context.colorScheme.onBackground;
    final hintStyle = context.textTheme.bodySmall?.copyWith(
      color: hintColor,
    );

    return SizedBox(
      height: Dimensions.kAuthorTextFieldSize,
      child: Consumer(builder: (ctx, ref, child) {
        return TextField(
          decoration: InputDecoration.collapsed(
            hintText: context.l10n.quoteAuhtor,
            hintStyle: hintStyle,
            border: OutlineInputBorder(
              borderRadius: Dimensions.kBorderRadiusAllLarge,
              borderSide: BorderSide.none,
            ),
          ),
          style: hintStyle,
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
