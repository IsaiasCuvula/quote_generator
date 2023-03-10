import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'Quote Generator';

  @override
  String get explore => 'Explore';

  @override
  String get nav_bar_home => 'Home';

  @override
  String get nav_bar_create_quote => 'Create Quote';

  @override
  String get nav_bar_search => 'Search';

  @override
  String get tab_bar_create_by_you => 'Created by you';

  @override
  String get tab_bar_favorite => 'Favorites';

  @override
  String get tab_bar_latest => 'Latest';

  @override
  String get empty_card_created_by_you => 'You haven\'t created any quotes yet';

  @override
  String get empty_card_favorite_quote => 'You haven\'t added any quotes to your favorites yet';
}
