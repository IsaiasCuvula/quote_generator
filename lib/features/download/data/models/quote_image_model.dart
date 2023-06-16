import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quote_generator/features/download/domain/entities/quote_image_entity.dart';

@immutable
class QuoteImageModel extends Equatable {
  final String id;
  final Uint8List imageData;
  const QuoteImageModel({
    required this.id,
    required this.imageData,
  });

  @override
  List<Object> get props => [id, imageData];

  factory QuoteImageModel.fromEntity(QuoteImage entity) {
    return QuoteImageModel(id: entity.id, imageData: entity.imageData);
  }

  QuoteImage toEntity() {
    return QuoteImage(id: id, imageData: imageData);
  }
}
