import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:quote_generator/core/core.dart';

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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      FirebaseFieldName.userId: userId,
      FirebaseFieldName.displayName: displayName,
      FirebaseFieldName.email: email,
      FirebaseFieldName.imageUrl: profileImage,
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> map) {
    return AppUser(
      userId: map[FirebaseFieldName.userId] as String,
      displayName: map[FirebaseFieldName.displayName] as String,
      email: map[FirebaseFieldName.email] as String,
      profileImage: map[FirebaseFieldName.imageUrl] as String,
    );
  }
}
