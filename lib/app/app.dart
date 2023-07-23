import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/features/features.dart';

class QuoteGeneratorApp extends ConsumerWidget {
  const QuoteGeneratorApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocale = ref.watch(appLocaleProvider);
    final theme = ref.watch(themeProvider);
    final routeConfig = ref.watch(routerProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (ctx, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Quote Generator',
          theme: QuoteGeneratorTheme.lightTheme,
          darkTheme: QuoteGeneratorTheme.darkTheme,
          themeMode: theme,
          locale: appLocale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerDelegate: routeConfig.routerDelegate,
          routeInformationParser: routeConfig.routeInformationParser,
          routeInformationProvider: routeConfig.routeInformationProvider,
        );
      },
    );
  }
}
