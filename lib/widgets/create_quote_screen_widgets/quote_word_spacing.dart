import 'package:flutter/material.dart';
import 'package:quote_generator/theme/theme.dart';
import 'package:quote_generator/widgets/widgets.dart';

class QuoteWordSpacingSizes extends StatefulWidget {
  const QuoteWordSpacingSizes({
    super.key,
  });

  @override
  State<QuoteWordSpacingSizes> createState() => _QuoteWordSpacingSizesState();
}

class _QuoteWordSpacingSizesState extends State<QuoteWordSpacingSizes> {
  int _isSelected = 0;
  final _wordSpaces = const [
    'None',
    'Small',
    'Medium',
    'Large',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsDisplayTitle(title: 'Word Spacing'),
        SizedBox(
          height: Dimensions.kQuoteTextSettingHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              final space = _wordSpaces[index];
              return TextSettingItemContainer(
                onTap: () {
                  setState(() {
                    _isSelected = index;
                  });
                },
                isSelected: _isSelected == index,
                child: Text(space),
              );
            },
            separatorBuilder: (ctx, index) {
              return Dimensions.kHorizontalSpaceMedium;
            },
            itemCount: _wordSpaces.length,
          ),
        ),
      ],
    );
  }
}
