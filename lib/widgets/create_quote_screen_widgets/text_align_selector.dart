import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/providers/text_settings_provider.dart';
import 'package:quote_generator/theme/dimensions.dart';
import 'package:quote_generator/widgets/widgets.dart';

class TextAlignSelector extends ConsumerStatefulWidget {
  const TextAlignSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TextAlignSelectorState();
}

class _TextAlignSelectorState extends ConsumerState<TextAlignSelector> {
  int _isSelected = 0;

  final _textAlignListIcons = const [
    FontAwesomeIcons.alignLeft,
    FontAwesomeIcons.alignCenter,
    FontAwesomeIcons.alignRight,
  ];

  TextAlign _selectedTextAlign(int index) {
    const textAlignList = [
      TextAlign.start,
      TextAlign.center,
      TextAlign.end,
    ];
    return textAlignList[index];
  }

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

              return TextSettingItemContainer(
                onTap: () {
                  ref
                      .read(textSettingsProvider.notifier)
                      .setAlign(_selectedTextAlign(index));
                  setState(() {
                    _isSelected = index;
                  });
                },
                isSelected: _isSelected == index,
                child: TextAlignDisplayIcon(
                  icon: textAlignIcon,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Dimensions.kHorizontalSpaceSmall;
            },
          ),
          Dimensions.kHorizontalSpaceLarge,
          const TextStyleSelector()
        ],
      ),
    );
  }
}
