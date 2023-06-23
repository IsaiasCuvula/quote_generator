import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/user_profile/user_profile.dart';

final getUserInfoProvider = StreamProvider.family.autoDispose<AppUser, String>(
  (
    ref,
    String userId,
  ) {
    final controller = StreamController<AppUser>();
    final getUserInfoUseCase = ref.watch(getUserInfoUseCaseProvider);

    final sub = getUserInfoUseCase(userId).listen(
      (snapshots) {
        snapshots.fold(
          (failure) => null,
          (appUser) {
            return controller.sink.add(appUser);
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
