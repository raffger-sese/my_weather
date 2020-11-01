/* --------------------- 3rd Party ------------------ */
import 'package:redux/redux.dart';
/* -------------------- Middleware ------------------ */
import '../middleware/home_middleware.dart';
import '../middleware/app_middleware.dart';
import '../middleware/auth_middleware.dart';
/* --------------------- Models --------------------- */
import '../models/states/app_state.dart';
/* --------------------- Reducers ------------------- */
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
