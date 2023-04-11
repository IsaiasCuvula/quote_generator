import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'translations/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @app_title.
  ///
  /// In en, this message translates to:
  /// **'Quote Generator'**
  String get app_title;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @nav_bar_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get nav_bar_home;

  /// No description provided for @nav_bar_create_quote.
  ///
  /// In en, this message translates to:
  /// **'Create Quote'**
  String get nav_bar_create_quote;

  /// No description provided for @nav_bar_search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get nav_bar_search;

  /// No description provided for @app_bar_create_by_you.
  ///
  /// In en, this message translates to:
  /// **'Created by You'**
  String get app_bar_create_by_you;

  /// No description provided for @app_bar_favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get app_bar_favorite;

  /// No description provided for @app_bar_latest.
  ///
  /// In en, this message translates to:
  /// **'Latest'**
  String get app_bar_latest;

  /// No description provided for @app_bar_search_quote.
  ///
  /// In en, this message translates to:
  /// **'Search Quote'**
  String get app_bar_search_quote;

  /// No description provided for @app_bar_quote_details.
  ///
  /// In en, this message translates to:
  /// **'Quote Details'**
  String get app_bar_quote_details;

  /// No description provided for @alert_title.
  ///
  /// In en, this message translates to:
  /// **'Delete this quote?'**
  String get alert_title;

  /// No description provided for @alert_content.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this quote?'**
  String get alert_content;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @empty_card_created_by_you.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t created any quotes yet'**
  String get empty_card_created_by_you;

  /// No description provided for @empty_card_favorite_quote.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t added any quotes to your favorites yet'**
  String get empty_card_favorite_quote;

  /// No description provided for @create_your_quote.
  ///
  /// In en, this message translates to:
  /// **'Create Your Quote'**
  String get create_your_quote;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @background_color.
  ///
  /// In en, this message translates to:
  /// **'Select background color'**
  String get background_color;

  /// No description provided for @select_color_shade.
  ///
  /// In en, this message translates to:
  /// **'Select color shade'**
  String get select_color_shade;

  /// No description provided for @write_your_quote_here.
  ///
  /// In en, this message translates to:
  /// **'Start writing your quote here ...'**
  String get write_your_quote_here;

  /// No description provided for @quote_auhtor.
  ///
  /// In en, this message translates to:
  /// **'Quote author ...'**
  String get quote_auhtor;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// No description provided for @small.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get small;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @large.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get large;

  /// No description provided for @letter_spacing.
  ///
  /// In en, this message translates to:
  /// **'Letter spacing'**
  String get letter_spacing;

  /// No description provided for @font_size.
  ///
  /// In en, this message translates to:
  /// **'Font size'**
  String get font_size;

  /// No description provided for @word_spacing.
  ///
  /// In en, this message translates to:
  /// **'Word spacing'**
  String get word_spacing;

  /// No description provided for @quote_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Quote created successfully!'**
  String get quote_created_successfully;

  /// No description provided for @quote_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'Quote deleted successfully'**
  String get quote_deleted_successfully;

  /// No description provided for @quote_removed_from_fav.
  ///
  /// In en, this message translates to:
  /// **'Quote removed from favorites successfully'**
  String get quote_removed_from_fav;

  /// No description provided for @quote_added_to_fav.
  ///
  /// In en, this message translates to:
  /// **'Quote added to favorites successfully'**
  String get quote_added_to_fav;

  /// No description provided for @empty_quote_alert.
  ///
  /// In en, this message translates to:
  /// **'Quote must not be empty!'**
  String get empty_quote_alert;

  /// No description provided for @enter_quote_to_save.
  ///
  /// In en, this message translates to:
  /// **'Please enter a quote to save this.'**
  String get enter_quote_to_save;

  /// No description provided for @search_quote_hintText.
  ///
  /// In en, this message translates to:
  /// **'Find a quote here ...'**
  String get search_quote_hintText;

  /// No description provided for @search_quote_empty_screen_title.
  ///
  /// In en, this message translates to:
  /// **'Search for a Quote'**
  String get search_quote_empty_screen_title;

  /// No description provided for @search_quote_empty_screen_descritpion.
  ///
  /// In en, this message translates to:
  /// **'Start typing to see suggestions'**
  String get search_quote_empty_screen_descritpion;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
