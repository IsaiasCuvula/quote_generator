import 'package:flutter/material.dart';
import 'package:quote_generator/widgets/widgets.dart';

class QuoteWordSpacingSizes extends StatelessWidget {
  const QuoteWordSpacingSizes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsDisplayTitle(title: 'Word Spacing'),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('Small'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Medium'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Large'),
            ),
          ],
        ),
      ],
    );
  }
}
