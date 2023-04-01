import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:quote_generator/translations/translations.dart';
import 'package:quote_generator/presentation/theme/theme.dart';

class ColorPickerPalette extends StatelessWidget {
  const ColorPickerPalette({
    super.key,
    required this.selectedColor,
    required this.onColorChanged,
  });

  final Color selectedColor;
  final Function(Color color) onColorChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 1,
        child: ColorPicker(
          color: selectedColor,
          onColorChanged: (Color color) => onColorChanged(color),
          width: Dimensions.colorPaletteWidth,
          height: Dimensions.colorPaletteHight,
          borderRadius: Dimensions.colorPaleteBorder,
          heading: Text(
            context.l10n.background_color,
            style: textTheme.headlineSmall,
          ),
          subheading: Text(
            context.l10n.select_color_shade,
            style: textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}
