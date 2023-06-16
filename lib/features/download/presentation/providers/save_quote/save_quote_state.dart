// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:quote_generator/features/download/download.dart';

@immutable
class SaveQuoteImageState extends Equatable {
  final QuoteImage? quoteImage;
  final String errorMessage;
  final bool isSuccess;
  final bool isLoading;

  const SaveQuoteImageState(
    this.quoteImage,
    this.errorMessage,
    this.isSuccess,
    this.isLoading,
  );

  const SaveQuoteImageState.initial({
    this.quoteImage,
    this.isLoading = false,
    this.errorMessage = '',
    this.isSuccess = false,
  });

  @override
  List<Object> get props => [
        quoteImage!,
        errorMessage,
        isSuccess,
        isLoading,
      ];

  SaveQuoteImageState copyWith({
    QuoteImage? quoteImage,
    String? errorMessage,
    bool? isSuccess,
    bool? isLoading,
  }) {
    return SaveQuoteImageState(
      quoteImage ?? this.quoteImage,
      errorMessage ?? this.errorMessage,
      isSuccess ?? this.isSuccess,
      isLoading ?? this.isLoading,
    );
  }
}
