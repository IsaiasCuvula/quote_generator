import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/theme/dimensions.dart';
import 'package:quote_generator/widgets/widgets.dart';

class QuoteTextAlign extends StatefulWidget {
  const QuoteTextAlign({
    super.key,
  });

  @override
  State<QuoteTextAlign> createState() => _QuoteTextAlignState();
}

class _QuoteTextAlignState extends State<QuoteTextAlign> {
  int _isSelected = 0;

  final _textAlignListIcons = const [
    FontAwesomeIcons.alignLeft,
    FontAwesomeIcons.alignCenter,
    FontAwesomeIcons.alignRight,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.kQuoteTextSettingHeight,
      child: Row(
        children: [
          ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _textAlignListIcons.length,
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              final textAlignIcon = _textAlignListIcons[index];
              final isSelected = _isSelected == index;

              return TextSettingItemContainer(
                onTap: () {
                  setState(() {
                    _isSelected = index;
                  });
                },
                isSelected: isSelected,
                child: TextAlignDisplayIcon(
                  isSelected: isSelected,
                  icon: textAlignIcon,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Dimensions.kHorizontalSpaceSmall;
            },
          ),
          Dimensions.kHorizontalSpaceLarge,
          const QuoteTextStyleAndWeight()
        ],
      ),
    );
  }
}
