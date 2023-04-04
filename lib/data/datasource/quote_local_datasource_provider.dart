import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/data/datasource/quote_local_datasource.dart';

final quoteLocalDataSourceProvider = Provider<QuoteLocalDatasource>((ref) {
  return QuoteLocalDatasource();
});
