import 'package:flutter/material.dart';
import 'package:my_weather/common/app_theme.dart';
import 'package:my_weather/common/constants.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:my_weather/screens/home_screen.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'models/app_state.dart';
import 'screens/main_screen.dart';

class App extends StatelessWidget {
  final Store<AppState> store;

  const App(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: Labels.APP_NAME,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.instance.appTheme,
          // darkTheme: ThemeData(brightness: Brightness.dark), // Todo: Create separa theme properties for dardk mode
          navigatorKey: NavigatorHolder.navigatorKey,
          onGenerateRoute: _getRoute,
        ));
  }
}

Route _getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.HOME:
      return _buildRoute(settings, MainScreen());
    case AppRoutes.DASHBOARD_SCREEN:
      return _buildRoute(settings, HomeScreen());
    default:
      return _buildRoute(settings, MainScreen());
  }
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return new MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) => builder,
  );
}
