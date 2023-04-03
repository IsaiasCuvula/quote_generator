import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/presentation/providers/text_settings_provider.dart';
import 'package:quote_generator/presentation/widgets/widgets.dart';

class BackgroundColorPicker extends ConsumerWidget {
  const BackgroundColorPicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundColor = ref.watch(textSettingsProvider).backgroundColor;
    return ColorPickerPalette(
      selectedColor: backgroundColor,
      onColorChanged: (Color color) {
        ref.read(textSettingsProvider.notifier).setColor(color);
      },
    );
  }
}
