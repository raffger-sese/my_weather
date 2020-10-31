import 'package:flutter/material.dart';

@immutable
class HomeState {
  final bool isLocationShown;
  final bool isLoadingLocation;
  final double latitude;
  final double longitude;
  final String error;

  HomeState({
    this.isLocationShown,
    this.isLoadingLocation,
    this.latitude,
    this.longitude,
    this.error,
  });

  factory HomeState.initial() {
    return HomeState(
      isLocationShown: false,
      isLoadingLocation: false,
      error: null,
      latitude: null,
      longitude: null,
    );
  }

  HomeState copyWith(
      {bool isLocationShown,
      bool isLoadingLocation,
      String error,
      double longitude,
      double latitude}) {
    return HomeState(
      isLocationShown: isLocationShown ?? this.isLocationShown,
      isLoadingLocation: isLoadingLocation ?? this.isLoadingLocation,
      error: error ?? this.error,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
