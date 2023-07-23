import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/features/auth/auth.dart';
import 'package:quote_generator/features/profile/presentation/presentation.dart';

class ProfileScreen extends ConsumerWidget {
  static ProfileScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const ProfileScreen();
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    final user = ref.watch(userProvider).appUser;
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: deviceSize.height * 0.4,
            flexibleSpace: FlexibleSpaceBar(
              background: ProfileScreenHeader(user: user!),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: Dimensions.kPaddingAllLarge,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Dimensions.kVerticalSpaceMedium,
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      user.displayName,
                      style: textTheme.headlineLarge,
                    ),
                  ),
                  Dimensions.kVerticalSpaceMedium,
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: BodyInfo(
                      displayTitle: l10n.email,
                      displayLabel: user.email,
                    ),
                  ),
                  Dimensions.kVerticalSpaceMedium,
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: BodyInfo(
                      displayTitle: l10n.signOut,
                      displayLabel: '',
                      iconData: FontAwesomeIcons.arrowRightFromBracket,
                      onTap: () async {
                        await ref.read(authProvider.notifier).signOut();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
