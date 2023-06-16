import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/download/download.dart';

final captureQuoteWidgetUsecaseProvider = Provider<CaptureQuoteWidget>((ref) {
  final repository = ref.watch(downloadRepositoryProvider);
  return CaptureQuoteWidget(repository);
});
