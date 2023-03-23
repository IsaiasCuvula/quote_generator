import 'package:flutter/material.dart';
import 'package:quote_generator/theme/dimensions.dart';
import 'package:quote_generator/translations/translations.dart';
import 'package:quote_generator/widgets/widgets.dart';

class TextSizeSelector extends StatefulWidget {
  const TextSizeSelector({
    Key? key,
  }) : super(key: key);

  @override
  State<TextSizeSelector> createState() => _TextSizeSelectorState();
}

class _TextSizeSelectorState extends State<TextSizeSelector> {
  int _isSelected = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final fontSizes = [
      Text(
        context.l10n.small,
        style: theme.textTheme.bodySmall,
      ),
      Text(
        context.l10n.medium,
        style: theme.textTheme.bodyMedium,
      ),
      Text(
        context.l10n.large,
        style: theme.textTheme.bodyLarge,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingTitle(title: context.l10n.font_size),
        SizedBox(
          height: Dimensions.kQuoteTextSettingHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              final fontSize = fontSizes[index];
              return TextSettingItemContainer(
                onTap: () {
                  setState(() {
                    _isSelected = index;
                  });
                },
                isSelected: _isSelected == index,
                child: fontSize,
              );
            },
            separatorBuilder: (ctx, index) {
              return Dimensions.kHorizontalSpaceMedium;
            },
            itemCount: fontSizes.length,
          ),
        ),
      ],
    );
  }
}
