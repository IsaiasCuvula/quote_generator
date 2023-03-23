import 'package:flutter/material.dart';
import 'package:quote_generator/theme/theme.dart';
import 'package:quote_generator/translations/translations.dart';
import 'package:quote_generator/widgets/widgets.dart';

class LetterSpacingSelector extends StatefulWidget {
  const LetterSpacingSelector({
    Key? key,
  }) : super(key: key);

  @override
  State<LetterSpacingSelector> createState() => _LetterSpacingSelectorState();
}

class _LetterSpacingSelectorState extends State<LetterSpacingSelector> {
  int _isSelected = 0;

  @override
  Widget build(BuildContext context) {
    final spaces = [
      Text(
        context.l10n.none,
      ),
      Text(
        context.l10n.small,
        style: TextStyle(
          letterSpacing: Dimensions.quoteTextLetterSpacingSmall,
        ),
      ),
      Text(
        context.l10n.medium,
        style: TextStyle(
          letterSpacing: Dimensions.quoteTextLetterSpacingMedium,
        ),
      ),
      Text(
        context.l10n.large,
        style: TextStyle(
          letterSpacing: Dimensions.quoteTextLetterSpacingLarge,
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingTitle(title: context.l10n.letter_spacing),
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
