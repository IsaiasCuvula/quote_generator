import 'package:flutter_riverpod/flutter_riverpod.dart';

final createQuoteProvider =
    StateNotifierProvider<CreateQuoteNotifier, String>((ref) {
  return CreateQuoteNotifier();
});

class CreateQuoteNotifier extends StateNotifier<String> {
  CreateQuoteNotifier() : super('');
}
