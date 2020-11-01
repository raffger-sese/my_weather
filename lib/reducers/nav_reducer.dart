/* --------------------- Flutter -------------------- */
import 'package:flutter/material.dart';
/* --------------------- 3rd Party ------------------ */
import 'package:redux/redux.dart';
/* -------------------- Actions --------------------- */
import '../actions/nav_actions.dart';
/* --------------------- Models --------------------- */
import '../models/states/nav_state.dart';
/* -------------------- Containers ------------------ */
import '../containers/home/profile_container.dart';
import '../containers/home/weather_forecast_container.dart';
import '../containers/home/home_container.dart';

Reducer<NavState> navReducer = combineReducers([
  TypedReducer<NavState, InitNav>(_initializeNav),
  TypedReducer<NavState, ChangeBottomNavAction>(_changeBottomNav),
]);

NavState _initializeNav(NavState state, InitNav action) {
  return state.copyWith(
    selectedBottomNav: 0,
    rootContainer: HomeContainer(),
  );
}

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
