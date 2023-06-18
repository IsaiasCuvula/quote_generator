import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:quote_generator/features/auth/auth.dart';

@immutable
class AuthState extends Equatable {
  final AppUser? appUser;
  final AuthResult authResult;
  final bool isLoading;

  const AuthState({
    this.appUser,
    required this.authResult,
    required this.isLoading,
  });

  const AuthState.initial({
    this.appUser,
    this.authResult = AuthResult.none,
    this.isLoading = false,
  });

  @override
  List<Object> get props => [
        appUser!,
        authResult,
        isLoading,
      ];

  @override
  bool get stringify => true;

  AuthState copyWith({
    AppUser? appUser,
    AuthResult? authResult,
    bool? isLoading,
  }) {
    return AuthState(
      appUser: appUser ?? this.appUser,
      authResult: authResult ?? this.authResult,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
