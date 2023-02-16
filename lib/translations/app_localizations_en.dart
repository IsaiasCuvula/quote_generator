import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'Quote Generator';

  @override
  String get nav_bar_home => 'Home';

  @override
  String get nav_bar_create_quote => 'Create Quote';

  @override
  String get nav_bar_search => 'Search';
}
