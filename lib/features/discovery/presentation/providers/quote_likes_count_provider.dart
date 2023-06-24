import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/discovery.dart';

final quoteLikesCountProvider =
    StreamProvider.family.autoDispose<int, String>((ref, String quoteId) {
  final counterUseCase = ref.watch(likesCountUsecaseProvider);
  final controller = StreamController<int>.broadcast();

  controller.onListen = () {
    controller.sink.add(0);
  };
  final sub = counterUseCase(quoteId).listen((snapshot) {
    snapshot.fold(
      (failure) => null,
      (totalCounted) {
        controller.sink.add(totalCounted);
      },
    );
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });
  return controller.stream;
});
