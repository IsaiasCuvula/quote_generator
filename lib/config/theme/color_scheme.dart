part of 'app_theme.dart';

@immutable
class _ColorScheme {
  static const _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: _QuoteGeneratorColors.lightPink,
    onPrimary: _QuoteGeneratorColors.lightOrange,
    secondary: _QuoteGeneratorColors.veryLightPink,
    onSecondary: _QuoteGeneratorColors.veryLightPink,
    tertiaryContainer: _QuoteGeneratorColors.brown,
    onTertiaryContainer: _QuoteGeneratorColors.white,
    error: _QuoteGeneratorColors.red,
    onError: _QuoteGeneratorColors.white,
    background: _QuoteGeneratorColors.white,
    onBackground: _QuoteGeneratorColors.white,
    surface: _QuoteGeneratorColors.white,
    onSurface: _QuoteGeneratorColors.white,
  );

  static const _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: _QuoteGeneratorColors.darkPink,
    onPrimary: _QuoteGeneratorColors.white,
    secondary: _QuoteGeneratorColors.lightOrange,
    onSecondary: _QuoteGeneratorColors.brown,
    tertiaryContainer: _QuoteGeneratorColors.white,
    onTertiaryContainer: _QuoteGeneratorColors.black,
    error: _QuoteGeneratorColors.red,
    onError: _QuoteGeneratorColors.white,
    background: _QuoteGeneratorColors.brown,
    onBackground: _QuoteGeneratorColors.white,
    surface: _QuoteGeneratorColors.black,
    onSurface: _QuoteGeneratorColors.white,
  );
}
