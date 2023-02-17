import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateQuoteScreen extends ConsumerWidget {
  static CreateQuoteScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateQuoteScreen();

  const CreateQuoteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create your quote'),
      ),
    );
  }
}
