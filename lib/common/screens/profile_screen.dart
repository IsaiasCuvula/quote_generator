import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/common/common.dart';

class ProfileScreen extends StatelessWidget {
  static ProfileScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const ProfileScreen();
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Profile Screen',
          style: context.textTheme.bodyLarge,
        ),
      ),
    );
  }
}
