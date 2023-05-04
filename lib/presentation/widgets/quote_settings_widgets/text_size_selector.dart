import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/presentation/providers/textsettings/text_settings_provider.dart';
import 'package:quote_generator/config/theme/dimensions.dart';
import 'package:quote_generator/translations/translations.dart';
import 'package:quote_generator/presentation/widgets/widgets.dart';

class TextSizeSelector extends ConsumerStatefulWidget {
  const TextSizeSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TextSizeSelectorState();
}

class _TextSizeSelectorState extends ConsumerState<TextSizeSelector> {
  int _isSelected = 0;

  double _selectedTextSize(int index) {
    final textSizeList = [
      Dimensions.quoteTextFontSizeSmall,
      Dimensions.quoteTextFontSizeMedium,
      Dimensions.quoteTextFontSizeLarge,
    ];
    return textSizeList[index];
  }

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
                  ref
                      .read(textSettingsProvider.notifier)
                      .setFontSize(_selectedTextSize(index));
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
