import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/domain/domain.dart';
import 'package:quote_generator/presentation/presentation.dart';

final quoteProvider = StateNotifierProvider<QuoteNotifier, QuoteState>((ref) {
  final quoteRepository = ref.read(quoteRepositoryProvider);
  return QuoteNotifier(quoteRepository, ref);
});
