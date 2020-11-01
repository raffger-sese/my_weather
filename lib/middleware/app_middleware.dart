/* --------------------- 3rd Party ------------------ */
import 'package:redux/redux.dart';
/* --------------------- Models --------------------- */
import '../models/states/app_state.dart';

class AppMiddleware {
  AppMiddleware();

  List<Middleware<AppState>> createAppMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, dynamic>(_logAction),
    ];
  }

  void _logAction(Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);

    print(action);
  }
}
