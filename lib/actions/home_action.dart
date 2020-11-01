/* --------------------- Models --------------------- */
import '../models/weather_forecast.dart';

class ShowLocation {
  final bool isShown;
  ShowLocation({this.isShown});
}

class RetrieveLocation {}

class LoadUserLocation {
  final double longitude;
  final double latitude;
  LoadUserLocation({this.longitude, this.latitude});
}

class RetrieveWeatherForecast {}

class LoadWeatherForecast {
  final List<WeatherForecast> forecasts;
  LoadWeatherForecast({this.forecasts});
}
