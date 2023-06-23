import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/shared/widgets/display_message_card.dart';
import 'package:quote_generator/features/shared/widgets/widgets.dart';

class FavoriteCounter extends ConsumerWidget {
  final String quoteId;
  const FavoriteCounter({Key? key, required this.quoteId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesCount = ref.watch(quoteFavoritesCountProvider(quoteId));
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
