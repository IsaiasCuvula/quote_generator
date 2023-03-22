import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/theme/theme.dart';
import 'package:quote_generator/widgets/widgets.dart';

class QuoteTextStyleAndWeight extends StatefulWidget {
  const QuoteTextStyleAndWeight({
    super.key,
  });

  @override
  State<QuoteTextStyleAndWeight> createState() =>
      _QuoteTextStyleAndWeightState();
}

class _QuoteTextStyleAndWeightState extends State<QuoteTextStyleAndWeight> {
  int _isSelected = -1;
  final _textStyleIcons = const [
    FaIcon(
      FontAwesomeIcons.bold,
    ),
    FaIcon(
      FontAwesomeIcons.italic,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.kQuoteTextSettingHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _textStyleIcons.length,
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          final icon = _textStyleIcons[index];
          return TextSettingItemContainer(
            onTap: () {
              setState(() {
                _isSelected = index;
              });
            },
            isSelected: _isSelected == index,
            child: icon,
          );
        },
        separatorBuilder: (ctx, index) {
          return Dimensions.kHorizontalSpaceSmall;
        },
      ),
    );
  }
}
