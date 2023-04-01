import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/presentation/providers/text_settings_provider.dart';
import 'package:quote_generator/presentation/theme/dimensions.dart';
import 'package:quote_generator/presentation/translations/l10n.dart';
import 'package:quote_generator/presentation/widgets/widgets.dart';

class CreateQuoteScreen extends ConsumerStatefulWidget {
  static CreateQuoteScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateQuoteScreen();
  const CreateQuoteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateQuoteScreenState();
}

class _CreateQuoteScreenState extends ConsumerState<CreateQuoteScreen> {
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
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final textSettings = ref.watch(textSettingsProvider);
    final textAlign = textSettings.textAlign;
    final backgroundColor = textSettings.backgroundColor;
    const textColor = Colors.white;
    final textFontSize = textSettings.fontSize;
    final textFontWeight = textSettings.fontWeight;
    final textFontStyle = textSettings.fontStyle;
    final textWordSpacing = textSettings.wordSpacing;
    final textLetterSpacing = textSettings.letterSpacing;
    final textDecoration = textSettings.textDecoration;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                //melhorar esse codigo adicionar dentro do method salvar
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Text(
                context.l10n.done.toUpperCase(),
                style: textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: Dimensions.kPaddingAllLarge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.l10n.create_your_quote,
                style: textTheme.displayMedium,
              ),
              Padding(
                padding: Dimensions.kPaddingSymetricVertical,
                child: Container(
                  width: Dimensions.kScreenWidth50,
                  height: Dimensions.kScreenHeight40,
                  padding: Dimensions.kPaddingAllLarge,
                  decoration: BoxDecoration(
                    color: textSettings.backgroundColor,
                    borderRadius: Dimensions.kBorderRadiusAllSmall,
                  ),
                  child: TextField(
                    controller: _quoteTextController,
                    decoration: InputDecoration.collapsed(
                      hintText: context.l10n.write_your_quote_here,
                      hintStyle: textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.background,
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
                      fontStyle: textFontStyle,
                      wordSpacing: textWordSpacing,
                      letterSpacing: textLetterSpacing,
                      decoration: textDecoration,
                    ),
                  ),
                ),
              ),
              const DisplayTextSettings(),
              ColorPickerPalette(
                selectedColor: backgroundColor,
                onColorChanged: (Color color) {
                  ref.read(textSettingsProvider.notifier).setColor(color);
                },
              ),
              Dimensions.kVerticalSpaceLargest,
            ],
          ),
        ),
      ),
    );
  }
}
