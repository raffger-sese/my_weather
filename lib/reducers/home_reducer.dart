/* --------------------- 3rd Party ------------------ */
import 'package:redux/redux.dart';
/* -------------------- Actions --------------------- */
import '../actions/home_action.dart';
/* --------------------- Models --------------------- */
import '../models/states/home_state.dart';

Reducer<HomeState> homeReducer = combineReducers([
  TypedReducer<HomeState, LoadUserLocation>(_loadUserLocation),
  TypedReducer<HomeState, ShowLocation>(_showCurrentLocation),
  TypedReducer<HomeState, LoadWeatherForecast>(_loadWeatherForecast),
]);

HomeState _loadUserLocation(HomeState state, LoadUserLocation action) {
  return state.copyWith(
    longitude: action.longitude,
    latitude: action.latitude,
  );
}

HomeState _showCurrentLocation(HomeState state, ShowLocation action) {
  return state.copyWith(
    isLocationShown: action.isShown,
  );
}

HomeState _loadWeatherForecast(HomeState state, LoadWeatherForecast action) {
  return state.copyWith(
    forecasts: action.forecasts,
  );
}
