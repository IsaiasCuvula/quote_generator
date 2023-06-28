import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/common/l10n/l10n.dart';
import 'package:quote_generator/common/l10n/widgets/widgets.dart';
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
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final themeState = ref.watch(themeProvider);
    final switchColor = colorScheme.primary;
    final themeLabelDisplay =
        themeState == ThemeMode.dark ? l10n.darkMode : l10n.lightMode;
    return Scaffold(
      body: BodyAndAppBarNestedScrollView(
        appBarTitle: l10n.appBarSettings,
        centerTitle: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Dimensions.kVerticalSpaceLarge,
            ListTile(
              leading: Text(
                l10n.language,
                style: textTheme.bodyMedium,
              ),
              trailing: Padding(
                padding: Dimensions.kPaddingAllSmall,
                child: const LanguageSelector(),
              ),
            ),
            ListTile(
              leading: Text(
                themeLabelDisplay,
                style: textTheme.bodyMedium,
              ),
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
