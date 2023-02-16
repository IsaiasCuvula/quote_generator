import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote Generator APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Text('Main Screen'),
    );
  }
}
