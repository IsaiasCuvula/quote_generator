import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:quote_generator/features/download/download.dart';

@immutable
class SaveQuoteImageState extends Equatable {
  final QuoteImage? quoteImage;
  final String errorMessage;
  final String successMessage;
  final bool isLoading;

  const SaveQuoteImageState(
    this.quoteImage,
    this.errorMessage,
    this.successMessage,
    this.isLoading,
  );

  const SaveQuoteImageState.initial({
    this.quoteImage,
    this.isLoading = false,
    this.errorMessage = '',
    this.successMessage = '',
  });

  @override
  List<Object> get props => [
        quoteImage!,
        errorMessage,
        successMessage,
        isLoading,
      ];

  SaveQuoteImageState copyWith({
    QuoteImage? quoteImage,
    String? errorMessage,
    String? successMessage,
    bool? isLoading,
  }) {
    return SaveQuoteImageState(
      quoteImage ?? this.quoteImage,
      errorMessage ?? this.errorMessage,
      successMessage ?? this.successMessage,
      isLoading ?? this.isLoading,
    );
  }
}
