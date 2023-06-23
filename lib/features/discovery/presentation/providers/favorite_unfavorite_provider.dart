import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/discovery.dart';

final favoriteAndUnforiteQuoteProvider = FutureProviderFamily(
  (ref, RemoteQuote quote) async {
    final favoritesUnfavoriteQuote = ref.watch(
      favoriteAndUnforiteQuoteUsecaseProvider,
    );
    return favoritesUnfavoriteQuote(quote);
  },
);
