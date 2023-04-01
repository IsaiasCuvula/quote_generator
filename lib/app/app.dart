import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_generator/presentation/routers/routes_config.dart';
import 'package:quote_generator/presentation/theme/theme.dart';
import 'package:quote_generator/presentation/translations/translations.dart';

class QuoteGeneratorApp extends StatelessWidget {
  const QuoteGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
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
        );
      },
    );
  }
}
