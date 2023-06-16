import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:quote_generator/features/download/download.dart';
import 'package:quote_generator/features/shared/shared.dart';
import 'package:dartz/dartz.dart';

class DownloadRepositoryImpl implements DownloadRepository {
  @override
  Future<Either<Failure, QuoteImage>> captureQuoteWidget(
      GlobalKey quoteWidgetKey) async {
    try {
      final RenderRepaintBoundary boundary = quoteWidgetKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;

      final ui.Image image = await boundary.toImage();

      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);

      final Uint8List pngBytes = byteData!.buffer.asUint8List();
      final quoteImage = QuoteImage(
        id: SharedHelpers.generateUUID(),
        imageData: pngBytes,
      );
      return Right(quoteImage);
    } catch (e) {
      return const Left(Failure(ErrorMessage.failToCreateImge));
    }
  }

  @override
  Future<Either<Failure, dynamic>> saveQuoteImageToDevice(
      QuoteImage image) async {
    try {
      final result = await ImageGallerySaver.saveImage(
        image.imageData,
        quality: 100,
        name: '${image.id} ${DateTime.now()}',
      );
      return Right(result);
    } catch (e) {
      return const Left(Failure(ErrorMessage.failToDownload));
    }
  }
}
