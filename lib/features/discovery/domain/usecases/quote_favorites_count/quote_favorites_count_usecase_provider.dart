import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/discovery.dart';

final quoteFavoritesCountUsecaseProvider = Provider<QuoteFavoritesCount>((ref) {
  final repository = ref.watch(remoteQuoteRepositoryProvider);
  return QuoteFavoritesCount(repository);
});
