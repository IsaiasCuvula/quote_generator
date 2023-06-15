import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/shared/shared.dart';

class SettingsScreen extends ConsumerWidget {
  static SettingsScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SettingsScreen();
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final themeState = ref.watch(themeProvider);
    final switchColor = context.colorScheme.primary;
    final themeLabelDisplay =
        themeState == ThemeMode.dark ? l10n.dark_mode : l10n.light_mode;
    return Scaffold(
      body: BodyAndAppBarNestedScrollView(
        appBarTitle: l10n.app_bar_settings,
        centerTitle: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Dimensions.kVerticalSpaceLarge,
            ListTile(
              leading: Text(l10n.language),
              trailing: Padding(
                padding: Dimensions.kPaddingAllSmall,
                child: const LanguageSelector(),
              ),
            ),
            ListTile(
              leading: Text(themeLabelDisplay),
              trailing: Switch(
                value: themeState == ThemeMode.dark,
                activeColor: switchColor,
                inactiveTrackColor: switchColor,
                onChanged: (value) {
                  ref.read(themeProvider.notifier).changeTheme(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
