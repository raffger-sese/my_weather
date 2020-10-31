import 'dart:async';
import 'dart:core';
import 'dart:convert';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:http/http.dart' as http;
import 'package:my_weather/common/constants.dart';
import 'package:my_weather/models/user.dart';
import 'package:my_weather/models/weather_forecast.dart';

abstract class WeatherService {
  Future<dynamic> getLocationWeather(double lat, double long);
}

class WeatherServiceImpl implements WeatherService {
  @override
  Future<dynamic> getLocationWeather(double lat, double long) async {
    final url =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&exclude=hourly,minutely&appid=${Constants.OPEN_WEATHER_API_KEY}';
    final response = await http.get(
      url,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['daily'];
    } else {
      throw Exception('Failed to get user details');
    }
  }
}
