import 'package:flutter/material.dart';
import 'package:my_weather/containers/home/profile_container.dart';
import 'package:my_weather/containers/home/weather_forecast_container.dart';
import 'package:redux/redux.dart';

import '../actions/nav_actions.dart';
import '../models/states/nav_state.dart';
import '../containers/home/home_container.dart';

Reducer<NavState> navReducer = combineReducers([
  TypedReducer<NavState, ChangeBottomNavAction>(_changeBottomNav),
]);

NavState _changeBottomNav(NavState state, ChangeBottomNavAction action) {
  Widget rootContainer = state.rootContainer;

  if (action.index == 0) {
    rootContainer = HomeContainer();
  } else if (action.index == 1) {
    rootContainer = WeatherForecastContainer();
  } else if (action.index == 2) {
    rootContainer = ProfileContainer();
  }

  return state.copyWith(
    selectedBottomNav: action.index,
    rootContainer: rootContainer,
  );
}
