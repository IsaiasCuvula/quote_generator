import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/discovery.dart';

final favoriteAndUnforiteQuoteUsecaseProvider =
    Provider<FavoritesAndUnfavoriteQuote>((ref) {
  final repository = ref.watch(remoteQuoteRepositoryProvider);
  return FavoritesAndUnfavoriteQuote(repository);
});
