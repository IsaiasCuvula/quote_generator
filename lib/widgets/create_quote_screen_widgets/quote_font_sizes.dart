import 'package:flutter/material.dart';
import 'package:quote_generator/theme/dimensions.dart';
import 'package:quote_generator/widgets/widgets.dart';

class QuoteTextFontSizes extends StatefulWidget {
  const QuoteTextFontSizes({
    super.key,
  });

  @override
  State<QuoteTextFontSizes> createState() => _QuoteTextFontSizesState();
}

class _QuoteTextFontSizesState extends State<QuoteTextFontSizes> {
  int _isSelected = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final fonts = [
      Text(
        'Small',
        style: theme.textTheme.bodySmall,
      ),
      Text(
        'Medium',
        style: theme.textTheme.bodyMedium,
      ),
      Text(
        'Large',
        style: theme.textTheme.bodyLarge,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsDisplayTitle(title: 'Font size'),
        SizedBox(
          height: Dimensions.kQuoteTextSettingHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              final font = fonts[index];
              return TextSettingItemContainer(
                onTap: () {
                  setState(() {
                    _isSelected = index;
                  });
                },
                isSelected: _isSelected == index,
                child: font,
              );
            },
            separatorBuilder: (ctx, index) {
              return Dimensions.kHorizontalSpaceMedium;
            },
            itemCount: fonts.length,
          ),
        )
      ],
    );
  }
}
