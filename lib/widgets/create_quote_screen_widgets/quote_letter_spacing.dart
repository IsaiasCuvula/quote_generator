import 'package:flutter/material.dart';
import 'package:quote_generator/theme/theme.dart';
import 'package:quote_generator/widgets/widgets.dart';

class QuoteLetterSpacingSizes extends StatefulWidget {
  const QuoteLetterSpacingSizes({
    super.key,
  });

  @override
  State<QuoteLetterSpacingSizes> createState() =>
      _QuoteLetterSpacingSizesState();
}

class _QuoteLetterSpacingSizesState extends State<QuoteLetterSpacingSizes> {
  int _isSelected = 0;

  @override
  Widget build(BuildContext context) {
    final spaces = [
      const Text(
        'None',
      ),
      Text(
        'Small',
        style: TextStyle(
          letterSpacing: Dimensions.quoteTextLetterSpacingSmall,
        ),
      ),
      Text(
        'Medium',
        style: TextStyle(
          letterSpacing: Dimensions.quoteTextLetterSpacingMedium,
        ),
      ),
      Text(
        'Large',
        style: TextStyle(
          letterSpacing: Dimensions.quoteTextLetterSpacingLarge,
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsDisplayTitle(title: 'Letter Spacing'),
        SizedBox(
          height: Dimensions.kQuoteTextSettingHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              final space = spaces[index];
              return TextSettingItemContainer(
                onTap: () {
                  setState(() {
                    _isSelected = index;
                  });
                },
                isSelected: _isSelected == index,
                child: space,
              );
            },
            separatorBuilder: (ctx, index) {
              return Dimensions.kHorizontalSpaceMedium;
            },
            itemCount: spaces.length,
          ),
        ),
      ],
    );
  }
}
