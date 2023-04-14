part of 'app_theme.dart';

@immutable
class _AppBarTheme {
  static const _appBarLightTheme = AppBarTheme(
    toolbarHeight: 50,
    backgroundColor: _QuoteGeneratorColors.white,
    titleTextStyle: TextStyle(color: _QuoteGeneratorColors.brown),
    shadowColor: Colors.transparent,
    titleSpacing: 1,
    actionsIconTheme: IconThemeData(color: _QuoteGeneratorColors.brown),
    iconTheme: IconThemeData(
      color: _QuoteGeneratorColors.brown,
    ),
  );

  static const _appBarDarkTheme = AppBarTheme(
    toolbarHeight: 50,
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(color: _QuoteGeneratorColors.brown),
    shadowColor: Colors.transparent,
    titleSpacing: 1,
    actionsIconTheme: IconThemeData(color: _QuoteGeneratorColors.white),
    centerTitle: true,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    foregroundColor: _QuoteGeneratorColors.white,
  );
}
