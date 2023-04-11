import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/presentation/presentation.dart';
import 'package:quote_generator/translations/translations.dart';

class QuoteGeneratorApp extends ConsumerWidget {
  const QuoteGeneratorApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocale = ref.watch(appLocaleProvider);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Quote Generator App',
          theme: QuoteGeneratorTheme.lightTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: RoutesConfig.routeConfig,
          locale: appLocale,
        );
      },
    );
  }
}
