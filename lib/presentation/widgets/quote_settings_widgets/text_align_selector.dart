import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/presentation/providers/textsettings/text_settings_provider.dart';
import 'package:quote_generator/config/theme/dimensions.dart';
import 'package:quote_generator/presentation/widgets/widgets.dart';
import 'package:quote_generator/utils/utils.dart';

class TextAlignSelector extends ConsumerStatefulWidget {
  const TextAlignSelector({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TextAlignSelectorState();
}

class _TextAlignSelectorState extends ConsumerState<TextAlignSelector> {
  final _textAlignListIcons = const [
    TextAlignDisplayIcon(
      icon: FontAwesomeIcons.alignLeft,
    ),
    TextAlignDisplayIcon(
      icon: FontAwesomeIcons.alignCenter,
    ),
    TextAlignDisplayIcon(
      icon: FontAwesomeIcons.alignRight,
    ),
    TextAlignDisplayIcon(
      icon: FontAwesomeIcons.alignJustify,
    ),
  ];

  TextAlign _selectedTextAlign(int index) {
    final List<TextAlign> textAlignList = Helpers.textAlignList.values.toList();
    return textAlignList[index];
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.kQuoteTextSettingHeight,
      child: Row(
        children: [
          SizedBox(
            height: Dimensions.kQuoteTextSettingHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _textAlignListIcons.length,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                final icon = _textAlignListIcons[index];
                final isSelected = index == _selectedIndex;

                return TextSettingItemContainer(
                  onTap: () {
                    ref
                        .read(textSettingsProvider.notifier)
                        .setAlign(_selectedTextAlign(index));
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  isSelected: isSelected,
                  child: icon,
                );
              },
              separatorBuilder: (ctx, index) {
                return Dimensions.kHorizontalSpaceSmall;
              },
            ),
          ),
          Dimensions.kHorizontalSpaceLarge,
          const TextFontWeightSelector(),
        ],
      ),
    );
  }
}
