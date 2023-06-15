import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/common/common.dart';

class QuoteTextField extends ConsumerStatefulWidget {
  const QuoteTextField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuoteTextFieldState();
}

class _QuoteTextFieldState extends ConsumerState<QuoteTextField> {
  late TextEditingController _quoteTextController;

  @override
  void initState() {
    super.initState();
    _quoteTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _quoteTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final textSettings = ref.watch(textSettingsProvider);
    final textAlign = textSettings.textAlign;
    final textColor = context.colorScheme.onBackground;
    final textFontSize = textSettings.fontSize;
    final textFontWeight = textSettings.fontWeight;
    final textWordSpacing = textSettings.wordSpacing;
    final textLetterSpacing = textSettings.letterSpacing;
    final backgroundColor = textSettings.backgroundColor;

    return Padding(
      padding: Dimensions.kPaddingVerticalLarge,
      child: Container(
        width: Dimensions.kScreenWidth50,
        height: Dimensions.kScreenHeight40,
        padding: Dimensions.kPaddingAllLarge,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: Dimensions.kBorderRadiusAllSmall,
        ),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _quoteTextController,
                decoration: InputDecoration.collapsed(
                  hintText: context.l10n.write_your_quote_here,
                  hintStyle: textTheme.bodyMedium?.copyWith(
                    color: textColor,
                  ),
                ),
                expands: true,
                maxLines: null,
                textAlignVertical: TextAlignVertical.center,
                scrollPadding: Dimensions.kPaddingAllLarge,
                autofocus: true,
                keyboardType: TextInputType.multiline,
                textAlign: textAlign,
                style: TextStyle(
                  color: textColor,
                  fontSize: textFontSize,
                  fontWeight: textFontWeight,
                  wordSpacing: textWordSpacing,
                  letterSpacing: textLetterSpacing,
                ),
                onChanged: (text) {
                  ref.read(textSettingsProvider.notifier).setQuoteText(text);
                },
              ),
            ),
            const SettingsDivider(thickness: 0.5),
            const AuthorTextField()
          ],
        ),
      ),
    );
  }
}
