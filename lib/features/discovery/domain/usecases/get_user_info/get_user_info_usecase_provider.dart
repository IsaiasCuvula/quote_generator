import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/discovery.dart';

final getUserInfoUseCaseProvider = Provider<GetUserInfo>((ref) {
  final repository = ref.watch(remoteQuoteRepositoryProvider);
  return GetUserInfo(repository);
});
