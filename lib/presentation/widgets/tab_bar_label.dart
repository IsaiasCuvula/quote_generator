import 'package:flutter/material.dart';

class TabBarLabel extends StatelessWidget {
  const TabBarLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(label),
      ),
    );
  }
}
