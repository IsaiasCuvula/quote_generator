import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedColorProvider = StateNotifierProvider((ref) {
  return SelectColorNotifier();
});

class SelectColorNotifier extends StateNotifier<Color> {
  SelectColorNotifier() : super(Colors.yellow);

  void selectColor(Color color) {
    state = color;
  }
}
