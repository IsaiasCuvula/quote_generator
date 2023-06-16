import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quote_generator/features/download/domain/domain.dart';
import 'package:quote_generator/features/shared/shared.dart';

abstract class DownloadRepository {
  Future<Either<Failure, QuoteImage>> captureQuoteWidget(
    GlobalKey quoteWidgetKey,
  );
  Future<Either<Failure, dynamic>> saveQuoteImageToDevice(
    QuoteImage image,
  );
}
