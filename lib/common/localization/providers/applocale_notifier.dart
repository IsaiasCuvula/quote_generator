import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/common/shared_prefs/shared_prefs.dart';
import 'package:quote_generator/features/quote/presentation/utils/utils.dart';

import '../translations/app_localizations.dart';

const _defaultLocale = Locale('en');

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(_defaultLocale) {
    _initializeLocaleFromSharedPrefs();
  }

  void _initializeLocaleFromSharedPrefs() {
    final languageCode = SharedPrefs.instance.getString(Constants.kLocale) ??
        _defaultLocale.languageCode;

    state = AppLocalizations.supportedLocales.firstWhere(
        (l) => l.languageCode == languageCode,
        orElse: () => _defaultLocale);
  }

  void setLocale(Locale locale) async {
    state = locale;
    await SharedPrefs.instance.setString(
      Constants.kLocale,
      locale.languageCode,
    );
  }
}
