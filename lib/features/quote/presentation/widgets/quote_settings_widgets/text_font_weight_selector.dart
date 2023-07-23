import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/core/core.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/config/config.dart';

class TextFontWeightSelector extends ConsumerStatefulWidget {
  const TextFontWeightSelector({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TextStyleSelectorState();
}

class _TextStyleSelectorState extends ConsumerState<TextFontWeightSelector> {
  final _textStyleIcons = const [
    FaIcon(FontAwesomeIcons.n),
    FaIcon(FontAwesomeIcons.bold),
  ];

  FontWeight _selectedFontWeight(int index) {
    final List<FontWeight> fontWeightList =
        AppHelpers.fontWeightList.values.toList();
    return fontWeightList[index];
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.kQuoteTextSettingHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _textStyleIcons.length,
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          final textStyleIcon = _textStyleIcons[index];
          final isSelected = index == _selectedIndex;
          return TextSettingItemContainer(
            onTap: () {
              ref
                  .read(textSettingsProvider.notifier)
                  .setFontWeight(_selectedFontWeight(index));
              setState(() {
                _selectedIndex = index;
              });
            },
            isSelected: isSelected,
            child: textStyleIcon,
          );
        },
        separatorBuilder: (ctx, index) {
          return Dimensions.kHorizontalSpaceSmall;
        },
      ),
    );
  }
}
