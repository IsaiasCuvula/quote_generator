import 'package:quote_generator/common/shared_prefs/shared_prefs.dart';
import 'package:quote_generator/features/quote/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system) {
    _initializeThemeFromSharedPrefs();
  }

  void _initializeThemeFromSharedPrefs() {
    final isDarkMode =
        SharedPrefs.instance.getBool(Constants.kDarkMode) ?? false;
    state = _getThemeMode(isDarkMode);
  }

  void changeTheme(bool isDarkMode) {
    state = _getThemeMode(isDarkMode);
    SharedPrefs.instance.setBool(Constants.kDarkMode, isDarkMode);
  }

  ThemeMode _getThemeMode(bool isDarkMode) {
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
}
