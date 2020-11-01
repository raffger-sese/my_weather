/* --------------------- Flutter -------------------- */
import 'package:flutter/material.dart';
/* --------------------- 3rd Party ------------------ */
import 'package:redux/redux.dart';
/* --------------------- Common --------------------- */
import 'common/app_theme.dart';
import 'package:my_weather/app.dart';
/* -------------------- Store ----------------------- */
import 'store/store.dart';
/* --------------------- Models --------------------- */
import 'models/states/app_state.dart';
/* -------------------- Utilities ------------------- */
import 'utils/dependency_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  final Store<AppState> store = createStore();
  AppTheme.instance.reloadTheme();
  runApp(App(store));
}
