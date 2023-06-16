import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class QuoteImage extends Equatable {
  final String id;
  final Uint8List imageData;
  const QuoteImage({
    required this.id,
    required this.imageData,
  });

  @override
  List<Object> get props => [id, imageData];
}
