import 'package:my_weather/middleware/home_middleware.dart';
import 'package:redux/redux.dart';

import '../middleware/app_middleware.dart';
import '../middleware/auth_middleware.dart';
import '../models/states/app_state.dart';
import '../reducers/app_reducer.dart';

Store<AppState> createStore() {
  return Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: []
      ..addAll(AuthMiddleware().createAuthMiddleware())
      ..addAll(AppMiddleware().createAppMiddleware())
      ..addAll(HomeMiddleware().createHomeMiddleware()),
  );
}
