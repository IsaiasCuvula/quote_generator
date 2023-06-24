import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/shared/util/types.dart';
import 'package:quote_generator/features/user_profile/user_profile.dart';

final favoriteAndUnforiteQuoteProvider = FutureProvider.autoDispose.family(
  (ref, String quoteId) async {
    final String userId = ref.watch(userProvider).appUser?.userId ?? '';
    final favoritesUnfavoriteQuote =
        ref.watch(favoriteAndUnforiteQuoteUsecaseProvider);
    final MapString info = {
      QuoteKey.quoteId: quoteId,
      QuoteKey.userId: userId,
    };
    return favoritesUnfavoriteQuote(info);
  },
);
