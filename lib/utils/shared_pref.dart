import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  SharedPref._internal();
  static final SharedPref instance = SharedPref._internal();

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getString(key) != null)
        ? json.decode(prefs.getString(key))
        : null;
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  deleteCache() async {}
}
