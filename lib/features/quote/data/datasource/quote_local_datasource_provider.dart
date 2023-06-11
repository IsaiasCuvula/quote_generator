import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';

final quoteLocalDataSourceProvider = Provider<QuoteLocalDatasource>((ref) {
  return QuoteLocalDatasource();
});
