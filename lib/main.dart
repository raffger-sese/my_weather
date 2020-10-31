import 'package:flutter/material.dart';
import 'package:my_weather/app.dart';
import 'package:my_weather/common/app_theme.dart';
import 'package:my_weather/store/store.dart';
import 'package:my_weather/utils/dependency_locator.dart';
import 'package:redux/redux.dart';

import 'models/app_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  final Store<AppState> store = createStore();
  AppTheme.instance.reloadTheme();
  runApp(App(store));
}
