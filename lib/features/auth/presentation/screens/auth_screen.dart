import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/features/features.dart';
import 'package:quote_generator/features/auth/auth.dart';

class AuthScreen extends ConsumerWidget {
  static AuthScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const AuthScreen();
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = context.textTheme;
    return Scaffold(
      body: Padding(
        padding: Dimensions.kPaddingAllLarge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.appTitle,
              style: textTheme.headlineLarge,
            ).animate().fade(duration: 1500.ms).fadeIn(),
            Dimensions.kVerticalSpaceLarge,
            ElevatedButton(
              onPressed: () async {
                await ref.read(authProvider.notifier).googleSignIn();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.google,
                    color: context.colorScheme.error,
                  ),
                  Dimensions.kHorizontalSpaceSmall,
                  Text(
                    context.l10n.signInGoogle,
                    style: textTheme.bodyMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
