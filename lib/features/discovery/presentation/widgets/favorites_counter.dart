import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/features/features.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/core/core.dart';

class FavoriteCounter extends ConsumerWidget {
  final String quoteId;
  const FavoriteCounter({Key? key, required this.quoteId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesCount = ref.watch(quoteLikesCountProvider(quoteId));

    return favoritesCount.when(
      data: (int favoritesCount) {
        return Text(
          '$favoritesCount',
          style: context.textTheme.labelMedium?.copyWith(
            color: context.colorScheme.primary,
          ),
        );
      },
      error: (error, stackTrace) {
        return DisplayErrorMessage(message: error.toString());
      },
      loading: () => const LoadingScreen(),
    );
  }
}
