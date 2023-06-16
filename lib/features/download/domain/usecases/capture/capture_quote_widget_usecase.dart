import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quote_generator/features/download/download.dart';
import 'package:quote_generator/features/shared/shared.dart';

class CaptureQuoteWidget implements UseCase<QuoteImage, GlobalKey> {
  final DownloadRepository _repository;

  CaptureQuoteWidget(this._repository);
  @override
  Future<Either<Failure, QuoteImage>> call(GlobalKey params) async {
    return await _repository.captureQuoteWidget(params);
  }
}
