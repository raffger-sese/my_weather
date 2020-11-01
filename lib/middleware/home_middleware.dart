/* --------------------- 3rd Party ------------------ */
import 'package:redux/redux.dart';
import 'package:geolocator/geolocator.dart';
/* -------------------- Actions --------------------- */
import '../actions/home_action.dart';
/* --------------------- Models --------------------- */
import '../models/states/app_state.dart';
import '../models/weather_forecast.dart';
/* -------------------- Utilities ------------------- */
import '../utils/dependency_locator.dart';
/* -------------------- Service --------------------- */
import '../services/weather_service.dart';

class HomeMiddleware {
  WeatherService _weatherService = getIt.get<WeatherService>();

  List<Middleware<AppState>> createHomeMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, RetrieveLocation>(_getCurrentLocation),
      TypedMiddleware<AppState, RetrieveWeatherForecast>(_getWeatherForecast),
    ];
  }

  void _getCurrentLocation(Store<AppState> store, RetrieveLocation action,
      NextDispatcher next) async {
    next(action);

    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      print(position);
      store.dispatch(LoadUserLocation(
          latitude: position.latitude, longitude: position.longitude));
    }).catchError((e) {
      print(e);
    });
  }

  void _getWeatherForecast(Store<AppState> store,
      RetrieveWeatherForecast action, NextDispatcher next) async {
    next(action);
    final lat = store.state.homeState.latitude;
    final long = store.state.homeState.longitude;

    try {
      List weatherData = await _weatherService.getLocationWeather(lat, long);
      List<WeatherForecast> weatherForecasts = List<WeatherForecast>();
      weatherData.forEach((dailyForecast) {
        final tmpDaily = WeatherForecast.fromJson(dailyForecast);
        weatherForecasts.add(tmpDaily);
      });
      store.dispatch(LoadWeatherForecast(forecasts: weatherForecasts));
      print(weatherForecasts);
    } catch (error) {
      print(error);
    }
  }
}
