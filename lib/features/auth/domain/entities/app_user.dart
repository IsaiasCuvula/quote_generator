import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppUser extends Equatable {
  final String userId;
  final String displayName;
  final String email;

  const AppUser({
    required this.userId,
    required this.displayName,
    required this.email,
  });

  @override
  List<Object> get props => [userId, displayName, email];
}
