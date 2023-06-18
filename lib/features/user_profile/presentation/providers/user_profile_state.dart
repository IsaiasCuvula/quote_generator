import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quote_generator/features/user_profile/user_profile.dart';

@immutable
class UserProfileState extends Equatable {
  final AppUser? appUser;
  final bool isLoading;

  const UserProfileState({
    this.appUser,
    required this.isLoading,
  });

  const UserProfileState.initial({
    this.appUser,
    this.isLoading = false,
  });

  @override
  List<Object> get props => [
        appUser!,
        isLoading,
      ];

  @override
  bool get stringify => true;

  UserProfileState copyWith({
    AppUser? appUser,
    bool? isLoading,
  }) {
    return UserProfileState(
      appUser: appUser ?? this.appUser,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
