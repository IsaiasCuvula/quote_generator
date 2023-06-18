import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppUser extends Equatable {
  final String userId;
  final String displayName;
  final String email;
  final String profileImage;

  const AppUser({
    required this.userId,
    required this.displayName,
    required this.email,
    required this.profileImage,
  });

  @override
  List<Object> get props => [userId, displayName, email, profileImage];
}
