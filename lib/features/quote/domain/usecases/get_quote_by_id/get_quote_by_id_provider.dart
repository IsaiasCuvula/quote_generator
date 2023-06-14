import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';

final getQuoteByIdUseCaseProvider = Provider<GetQuoteById>((ref) {
  final repository = ref.read(quoteRepositoryProvider);
  return GetQuoteById(repository);
});
