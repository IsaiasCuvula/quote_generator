import 'package:flutter/material.dart';
import 'package:quote_generator/screens/screens.dart';
import 'package:quote_generator/translations/translations.dart';

class QuoteGeneratorApp extends StatelessWidget {
  const QuoteGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quote Generator APP',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MainScreen(),
    );
  }
}
