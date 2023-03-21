import 'package:flutter/material.dart';
import 'package:quote_generator/theme/theme.dart';
import 'package:quote_generator/widgets/widgets.dart';

class QuoteLetterSpacingSizes extends StatelessWidget {
  const QuoteLetterSpacingSizes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsDisplayTitle(title: 'Letter Spacing'),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Small',
                style: TextStyle(
                  letterSpacing: Dimensions.quoteTextLetterSpacingSmall,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Medium',
                style: TextStyle(
                  letterSpacing: Dimensions.quoteTextLetterSpacingMedium,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Large',
                style: TextStyle(
                  letterSpacing: Dimensions.quoteTextLetterSpacingLarge,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
