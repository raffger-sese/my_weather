import 'package:flutter/material.dart';

@immutable
class HomeState {
  final bool isLocationShown;
  final bool isLoadingLocation;
  final String error;

  HomeState({
    this.isLocationShown,
    this.isLoadingLocation,
    this.error,
  });

  factory HomeState.initial() {
    return HomeState(
      isLocationShown: false,
      isLoadingLocation: false,
      error: null,
    );
  }

  HomeState copyWith(
      {bool isLocationShown, bool isLoadingLocation, String error}) {
    return HomeState(
      isLocationShown: isLocationShown ?? this.isLocationShown,
      isLoadingLocation: isLoadingLocation ?? this.isLoadingLocation,
      error: error ?? this.error,
    );
  }
}
