import 'package:flutter/material.dart';

import 'user.dart';

@immutable
class AuthState {
  final bool isLoading;
  final bool isAuthenticated;
  final User user;
  final String token;
  final String error;

  AuthState({
    this.isLoading,
    this.isAuthenticated,
    this.user,
    this.token,
    this.error,
  });

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      isAuthenticated: false,
      user: null,
      token: null,
    );
  }

  AuthState copyWith(
      {bool isLoading,
      bool isAuthenticated,
      User user,
      String token,
      String error}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
      token: token ?? this.token,
      error: error ?? this.error,
    );
  }
}
