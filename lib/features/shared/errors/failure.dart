import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class Failure extends Equatable {
  final String message;

  const Failure(this.message);
  @override
  List<Object?> get props => [message];
}
