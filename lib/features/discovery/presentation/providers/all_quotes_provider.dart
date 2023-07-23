import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/core/core.dart';

final allQuotesProvider = StreamProvider.autoDispose<Iterable<RemoteQuote>>(
  (ref) {
    final controller = StreamController<Iterable<RemoteQuote>>();
    final getAllQuotes = ref.watch(getAllQuotesUseCaseProvider);

    controller.onListen = () {
      controller.sink.add([]);
    };

    final sub = getAllQuotes(NoParams()).listen((snapshots) {
      snapshots.fold(
        (failure) => null,
        (remoteQuote) {
          return controller.sink.add(remoteQuote);
        },
      );
    });

    ref.onDispose(() {
      sub.cancel();
      controller.close();
    });

    return controller.stream;
  },
);
