import 'package:my_weather/reducers/home_reducer.dart';

import '../models/states/app_state.dart';
import '../reducers/auth_reducer.dart';
import '../reducers/nav_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    authState: authReducer(state.authState, action),
    navState: navReducer(state.navState, action),
    homeState: homeReducer(state.homeState, action),
  );
}
