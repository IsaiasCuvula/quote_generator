import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/data/data.dart';
import 'package:quote_generator/domain/repositories/repositories.dart';

final quoteRepositoryProvider = Provider<QuoteRepository>((ref) {
  final localDatasource = ref.read(quoteLocalDataSourceProvider);
  return QuoteRepositoryImpl(localDatasource);
});
