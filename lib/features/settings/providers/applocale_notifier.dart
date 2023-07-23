import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/core/core.dart';

enum AppLocale {
  en(Locale('en', 'US')),
  pt(Locale('pt', 'BR'));

  final Locale locale;
  const AppLocale(this.locale);
}

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(AppLocale.en.locale) {
    _initializeLocaleFromSharedPrefs();
  }

  void _initializeLocaleFromSharedPrefs() {
    try {
      final locale = SharedPrefs.instance.getString(AppKeys.kLocale) ?? 'en_US';
      if (locale == 'en_US') {
        state = AppLocale.en.locale;
      } else {
        state = AppLocale.pt.locale;
      }
    } catch (e) {
      state = AppLocale.en.locale;
    }
  }

  void setLocale(Locale locale) async {
    state = locale;
    await SharedPrefs.instance.setString(
      AppKeys.kLocale,
      locale.toString(),
    );
  }
}
