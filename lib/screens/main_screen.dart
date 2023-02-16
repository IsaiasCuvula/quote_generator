import 'package:flutter/material.dart';
import 'package:quote_generator/translations/l10n.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Column(
        children: [
          Text(context.l10n.nav_bar_home),
        ],
      ),
    );
  }
}
