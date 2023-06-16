import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/download/download.dart';

final downloadRepositoryProvider = Provider<DownloadRepository>((ref) {
  return DownloadRepositoryImpl();
});
