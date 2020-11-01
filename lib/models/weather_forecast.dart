/* -------------------- Utilities ------------------- */
import 'package:my_weather/utils/date_util.dart';

class WeatherForecast {
  final String date;
  final double tempInF;
  final String description;
  final String main;
  final int pressure;
  final int humidity;

  WeatherForecast(
      {this.date,
      this.tempInF,
      this.description,
      this.main,
      this.pressure,
      this.humidity});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      date: DateUtil.instance.formatDateFromMillis(json['dt']),
      tempInF: json['temp']['day'],
      description: (json['weather'][0])['description'],
      main: (json['weather'][0])['main'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date ?? '',
        'tempInF': tempInF ?? 0,
        'description': description ?? '',
        'main': main ?? '',
        'pressure': pressure ?? '',
        'humidity': humidity ?? '',
      };
}
