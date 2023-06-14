import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';

final getQuotesUseCaseProvider = Provider<GetQuotes>((ref) {
  final repository = ref.read(quoteRepositoryProvider);
  return GetQuotes(repository);
});
