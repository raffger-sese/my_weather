/* --------------------- Flutter -------------------- */
import 'package:flutter/material.dart';
/* --------------------- Models --------------------- */
import '../../models/weather_forecast.dart';

@immutable
class HomeState {
  final bool isLocationShown;
  final bool isLoadingLocation;
  final List<WeatherForecast> forecasts;
  final double latitude;
  final double longitude;
  final String error;

  HomeState({
    this.isLocationShown,
    this.isLoadingLocation,
    this.forecasts,
    this.latitude,
    this.longitude,
    this.error,
  });

  factory HomeState.initial() {
    return HomeState(
      isLocationShown: false,
      isLoadingLocation: false,
      forecasts: [],
      error: null,
      latitude: null,
      longitude: null,
    );
  }

  HomeState copyWith(
      {bool isLocationShown,
      bool isLoadingLocation,
      List<WeatherForecast> forecasts,
      String error,
      double longitude,
      double latitude}) {
    return HomeState(
      isLocationShown: isLocationShown ?? this.isLocationShown,
      isLoadingLocation: isLoadingLocation ?? this.isLoadingLocation,
      forecasts: forecasts ?? this.forecasts,
      error: error ?? this.error,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
