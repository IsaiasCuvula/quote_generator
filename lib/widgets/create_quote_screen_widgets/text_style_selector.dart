import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/providers/text_settings_provider.dart';
import 'package:quote_generator/theme/theme.dart';
import 'package:quote_generator/widgets/widgets.dart';

class TextStyleSelector extends ConsumerStatefulWidget {
  const TextStyleSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TextStyleSelectorState();
}

class _TextStyleSelectorState extends ConsumerState<TextStyleSelector> {
  int _isSelected = 0;
  final _textStyleIcons = const [
    FaIcon(
      FontAwesomeIcons.n,
    ),
    FaIcon(
      FontAwesomeIcons.bold,
    ),
    FaIcon(
      FontAwesomeIcons.italic,
    ),
    FaIcon(
      FontAwesomeIcons.underline,
    ),
  ];

  FontWeight _selectedFontWeight(int index) {
    final fontWeightList = [
      FontWeight.normal,
      FontWeight.bold,
    ];
    return fontWeightList[index];
  }

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
              if (index < 2) {
                ref
                    .read(textSettingsProvider.notifier)
                    .setFontWeight(_selectedFontWeight(index));
              }
              if (index == 2) {
                ref
                    .read(textSettingsProvider.notifier)
                    .setFontStyle(FontStyle.italic);
              }
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
