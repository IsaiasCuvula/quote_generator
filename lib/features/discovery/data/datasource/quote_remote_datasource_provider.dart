import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/data/data.dart';

final quoteRemoteDataSourceProvider = Provider<QuoteRemoteDatasource>((ref) {
  return QuoteRemoteDatasourceImpl();
});
