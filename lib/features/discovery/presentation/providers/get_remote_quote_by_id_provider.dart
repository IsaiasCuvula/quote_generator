import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/discovery.dart';

final getRemoteQuoteByIdProvider =
    StreamProvider.family.autoDispose<RemoteQuote, String>(
  (
    ref,
    String quoteId,
  ) {
    final controller = StreamController<RemoteQuote>();
    final getRemoteQuote = ref.watch(getRemoteQuoteByIdUseCaseProvider);

    final sub = getRemoteQuote(quoteId).listen(
      (snapshots) {
        snapshots.fold(
          (failure) => null,
          (remoteQuote) {
            return controller.sink.add(remoteQuote);
          },
        );
      },
    );

    ref.onDispose(() {
      sub.cancel();
      controller.close();
    });

    return controller.stream;
  },
);
