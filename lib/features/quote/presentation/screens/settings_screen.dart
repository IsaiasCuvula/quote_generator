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
    final theme = Theme.of(context);
    final themeState = ref.watch(themeProvider);
    final switchColor = theme.colorScheme.primary;
    final themeLabelDisplay = themeState == ThemeMode.dark
        ? context.l10n.dark_mode
        : context.l10n.light_mode;
    return Scaffold(
      body: BodyAndAppBarNestedScrollView(
        appBarTitle: context.l10n.app_bar_settings,
        centerTitle: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Dimensions.kVerticalSpaceLarge,
            ListTile(
              leading: Text(context.l10n.language),
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
