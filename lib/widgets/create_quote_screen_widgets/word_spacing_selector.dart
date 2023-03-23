import 'package:flutter/material.dart';
import 'package:quote_generator/theme/theme.dart';
import 'package:quote_generator/translations/translations.dart';
import 'package:quote_generator/widgets/widgets.dart';

class WordSpacingSelector extends StatefulWidget {
  const WordSpacingSelector({
    Key? key,
  }) : super(key: key);

  @override
  State<WordSpacingSelector> createState() => _WordSpacingSelectorState();
}

class _WordSpacingSelectorState extends State<WordSpacingSelector> {
  int _isSelected = 0;

  @override
  Widget build(BuildContext context) {
    final wordSpaces = [
      context.l10n.none,
      context.l10n.small,
      context.l10n.medium,
      context.l10n.large,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingTitle(title: context.l10n.word_spacing),
        SizedBox(
          height: Dimensions.kQuoteTextSettingHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              final space = wordSpaces[index];
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
            itemCount: wordSpaces.length,
          ),
        ),
      ],
    );
  }
}
