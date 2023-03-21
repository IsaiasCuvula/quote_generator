import 'package:flutter/material.dart';
import 'package:quote_generator/widgets/widgets.dart';

class QuoteTextSettings extends StatelessWidget {
  const QuoteTextSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TextSettingsDivider(),
        QuoteTextAlign(),
        TextSettingsDivider(),
        QuoteTextFontSizes(),
        TextSettingsDivider(),
        QuoteLetterSpacingSizes(),
        TextSettingsDivider(),
        QuoteWordSpacingSizes(),
        TextSettingsDivider(),
      ],
    );
  }
}
