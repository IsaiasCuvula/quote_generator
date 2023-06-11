import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_generator/common/common.dart';

class QuoteGeneratorApp extends ConsumerWidget {
  const QuoteGeneratorApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocale = ref.watch(appLocaleProvider);
    final theme = ref.watch(themeProvider);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Quote Generator App',
          theme: QuoteGeneratorTheme.lightTheme,
          darkTheme: QuoteGeneratorTheme.darkTheme,
          themeMode: theme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: RoutesConfig.routeConfig,
          locale: appLocale,
        );
      },
    );
  }
}
