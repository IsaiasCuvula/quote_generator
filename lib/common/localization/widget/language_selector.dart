import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/common/common.dart';

class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(appLocaleProvider);

    return DropdownButton<Locale>(
      value: selectedLanguage,
      icon: const Icon(Icons.language),
      onChanged: (Locale? locale) {
        if (locale != null) {
          ref.read(appLocaleProvider.notifier).setLocale(locale);
        }
      },
      items:
          _getSupportedLocale().map<DropdownMenuItem<Locale>>((Locale locale) {
        return DropdownMenuItem<Locale>(
          value: locale,
          child: Text(locale.languageCode.toUpperCase()),
        );
      }).toList(),
    );
  }

  List<Locale> _getSupportedLocale() {
    return List.generate(
      AppLocale.values.length,
      (index) => AppLocale.values[index].locale,
    );
  }
}
