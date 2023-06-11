import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'textsettings_notifier.dart';
import 'textsettings_state.dart';

final textSettingsProvider =
    StateNotifierProvider.autoDispose<TextSettingsNotifier, TextSettingsState>(
        (ref) {
  return TextSettingsNotifier();
});
