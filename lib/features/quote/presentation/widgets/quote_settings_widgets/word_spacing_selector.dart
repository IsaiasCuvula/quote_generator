import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/common/l10n/l10n.dart';

class WordSpacingSelector extends ConsumerStatefulWidget {
  const WordSpacingSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WordSpacingSelectorState();
}

class _WordSpacingSelectorState extends ConsumerState<WordSpacingSelector> {
  int _isSelected = 0;

  double _selectedWordSpacingSize(int index) {
    final wordSpacingSize = [
      Dimensions.quoteTextWordSpacingNone,
      Dimensions.quoteTextWordSpacingSmall,
      Dimensions.quoteTextWordSpacingMedium,
      Dimensions.quoteTextWordSpacingLarge,
    ];
    return wordSpacingSize[index];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final wordSpaces = [
      l10n.none,
      l10n.small,
      l10n.medium,
      l10n.large,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingTitle(title: l10n.wordSpacing),
        SizedBox(
          height: Dimensions.kQuoteTextSettingHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              final space = wordSpaces[index];
              return TextSettingItemContainer(
                onTap: () {
                  ref
                      .read(textSettingsProvider.notifier)
                      .setWordSpacing(_selectedWordSpacingSize(index));
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
