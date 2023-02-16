import 'package:flutter/material.dart';

class QuoteGeneratorTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _ColorScheme._lightColorScheme,
    textTheme: _TextTheme._textTheme,
    fontFamily: 'Dosis',
    appBarTheme: _AppBarTheme._appBarTheme,
    scaffoldBackgroundColor: _ColorScheme._lightColorScheme.background,
  );
}

class _AppBarTheme {
  static const _appBarTheme = AppBarTheme(
    toolbarHeight: 50,
    backgroundColor: _QuoteGeneratorColors.white,
    titleTextStyle: TextStyle(color: _QuoteGeneratorColors.brown),
    shadowColor: Colors.transparent,
    titleSpacing: 1,
    actionsIconTheme: IconThemeData(color: _QuoteGeneratorColors.brown),
  );
}

class _ColorScheme {
  static const _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: _QuoteGeneratorColors.lightPink,
    onPrimary: _QuoteGeneratorColors.lightOrange,
    secondary: _QuoteGeneratorColors.veryLightPink,
    onSecondary: _QuoteGeneratorColors.veryLightPink,
    tertiaryContainer: _QuoteGeneratorColors.white,
    onTertiaryContainer: _QuoteGeneratorColors.white,
    error: _QuoteGeneratorColors.red,
    onError: _QuoteGeneratorColors.white,
    background: _QuoteGeneratorColors.white,
    onBackground: _QuoteGeneratorColors.white,
    surface: _QuoteGeneratorColors.white,
    onSurface: _QuoteGeneratorColors.black,
  );
}

class _TextTheme {
  static const _textTheme = TextTheme(
    ///DISPLAY
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: _QuoteGeneratorColors.brown,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: _QuoteGeneratorColors.brown,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: _QuoteGeneratorColors.brown,
    ),

    //HEADLINE
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: _QuoteGeneratorColors.brown,
    ),
    headlineMedium: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w700,
      color: _QuoteGeneratorColors.brown,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: _QuoteGeneratorColors.brown,
    ),

    //TITLE
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: _QuoteGeneratorColors.brown,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: _QuoteGeneratorColors.brown,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: _QuoteGeneratorColors.brown,
    ),

    //BODY
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: _QuoteGeneratorColors.brown,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: _QuoteGeneratorColors.brown,
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: _QuoteGeneratorColors.brown,
    ),

    //LABEL
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: _QuoteGeneratorColors.brown,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: _QuoteGeneratorColors.brown,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: _QuoteGeneratorColors.brown,
    ),
  );
}

class _QuoteGeneratorColors {
  static const Color lightPink = Color(0xffF0CAC0);
  static const Color lightOrange = Color(0xffF0CAC0);
  static const Color veryLightPink = Color(0xffFEEAE6);
  static const Color brown = Color(0xff452C2E);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color red = Colors.red;
}
