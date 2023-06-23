import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/shared/shared.dart';

final hasFavoritedQuoteProvider = StreamProvider.family
    .autoDispose<bool, RemoteQuote>((ref, RemoteQuote quote) {
  final hasFavoriteUseCase = ref.watch(hasFavoritedQuoteUsecaseProvider);

  final controller = StreamController<bool>();

  final MapString info = {
    QuoteKey.quoteId: quote.quoteId,
    QuoteKey.userId: quote.userId,
  };
  final sub = hasFavoriteUseCase(info).listen((snapshot) {
    snapshot.fold(
      (failure) => null,
      (isFavorite) {
        controller.sink.add(isFavorite);
      },
    );
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });
  return controller.stream;
});
