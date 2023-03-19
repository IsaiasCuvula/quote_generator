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

  @override
  void initState() {
    super.initState();
    selectedColor = Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
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
                height: Dimensions.kScreenHeight50,
                decoration: BoxDecoration(
                  color: selectedColor,
                  borderRadius: Dimensions.kBorderRadiusAllSmall,
                ),
                child: Container(),
              ),
            ),
            ColorPickerPallet(
              selectedColor: selectedColor,
              onColorChanged: (Color color) {
                setState(() => selectedColor = color);
              },
            ),
            Dimensions.kVerticalSpaceLargest,
          ],
        ),
      ),
    );
  }
}
