import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextAlignDisplayIcon extends StatelessWidget {
  const TextAlignDisplayIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FaIcon(icon);
  }
}
