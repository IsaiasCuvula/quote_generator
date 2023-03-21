import 'package:flutter/material.dart';
import 'package:quote_generator/widgets/widgets.dart';

class QuoteTextFontSizes extends StatelessWidget {
  const QuoteTextFontSizes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsDisplayTitle(title: 'Font size'),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Small',
                style: theme.textTheme.bodySmall,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Medium',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Large',
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
