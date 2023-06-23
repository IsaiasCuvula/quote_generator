import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/discovery.dart';

final hasFavoritedQuoteUsecaseProvider = Provider<HasFavoritedPost>((ref) {
  final repository = ref.watch(remoteQuoteRepositoryProvider);
  return HasFavoritedPost(repository);
});
