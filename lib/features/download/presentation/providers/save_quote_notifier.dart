import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/download/download.dart';

class SaveQuoteImageNotifier extends StateNotifier<SaveQuoteImageState> {
  SaveQuoteImageNotifier(this._captureQuoteWidget, this._saveImageUseCase)
      : super(const SaveQuoteImageState.initial());
  final CaptureQuoteWidget _captureQuoteWidget;
  final SaveImageUseCase _saveImageUseCase;

  Future<void> _saveImage() async {
    state.copyWith(isLoading: true);
    final image = state.quoteImage;
    if (image != null) {
      final result = await _saveImageUseCase(image);
      state = result.fold(
        (failure) => state.copyWith(
          errorMessage: failure.message,
          isLoading: false,
        ),
        (result) {
          return state.copyWith(
            successMessage: result.entries.first.value,
            isLoading: false,
          );
        },
      );
    }
  }

  Future<void> captureQuoteWidgetAsImage(GlobalKey widgetKey) async {
    final result = await _captureQuoteWidget(widgetKey);
    state = result.fold(
      (failure) => state.copyWith(
        errorMessage: failure.message,
        isLoading: false,
      ),
      (quoteImage) => state.copyWith(
        quoteImage: quoteImage,
        isLoading: false,
      ),
    );
    await _saveImage();
  }
}
