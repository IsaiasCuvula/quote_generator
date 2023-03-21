import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/theme/dimensions.dart';
import 'package:quote_generator/translations/l10n.dart';
import 'package:quote_generator/widgets/widgets.dart';

class CreateQuoteScreen extends StatefulWidget {
  static CreateQuoteScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateQuoteScreen();
  const CreateQuoteScreen({super.key});

  @override
  State<CreateQuoteScreen> createState() => _CreateQuoteScreenState();
}

class _CreateQuoteScreenState extends State<CreateQuoteScreen> {
  late Color selectedColor;
  late TextEditingController _quoteTextController;
  late TextAlign quoteTextAlign;
  late Color quoteTextColor;
  late double quoteTextFontSize;
  late FontWeight quoteTextFontWeight;
  late FontStyle quoteTextFontStyle;
  late double quoteTextWordSpacing;
  late double quoteTextLetterSpacing;

  @override
  void initState() {
    super.initState();
    selectedColor = Colors.green;
    _quoteTextController = TextEditingController();
    quoteTextAlign = TextAlign.center;
    quoteTextColor = Colors.white;
    quoteTextFontSize = Dimensions.quoteTextFontSizeMedium;
    quoteTextFontWeight = FontWeight.bold;
    quoteTextFontStyle = FontStyle.italic;
    quoteTextWordSpacing = Dimensions.quoteTextWordSpacingSmall;
    quoteTextLetterSpacing = Dimensions.quoteTextLetterSpacingNone;
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
                    color: selectedColor,
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
                    textAlign: quoteTextAlign,
                    style: TextStyle(
                      color: quoteTextColor,
                      fontSize: quoteTextFontSize,
                      fontWeight: quoteTextFontWeight,
                      fontStyle: quoteTextFontStyle,
                      wordSpacing: quoteTextWordSpacing,
                      letterSpacing: quoteTextLetterSpacing,
                    ),
                  ),
                ),
              ),
              const QuoteTextSettings(),
              ColorPickerPalette(
                selectedColor: selectedColor,
                onColorChanged: (Color color) {
                  setState(() => selectedColor = color);
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
