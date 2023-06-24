import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/discovery.dart';

final likeDislikeQuoteUsecaseProvider = Provider<LikeDislikeQuote>((ref) {
  final repository = ref.watch(remoteQuoteRepositoryProvider);
  return LikeDislikeQuote(repository);
});
