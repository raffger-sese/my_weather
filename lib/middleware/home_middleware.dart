import 'package:geolocator/geolocator.dart';
import 'package:my_weather/actions/home_action.dart';
import 'package:my_weather/models/states/app_state.dart';
import 'package:redux/redux.dart';

class HomeMiddleware {
  List<Middleware<AppState>> createHomeMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, RetrieveLocation>(_getCurrentLocation),
    ];
  }

  void _getCurrentLocation(Store<AppState> store, RetrieveLocation action,
      NextDispatcher next) async {
    next(action);

    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      print(position);
      store.dispatch(LoadUserLocation(
          latitude: position.latitude, longitude: position.longitude));
    }).catchError((e) {
      print(e);
    });
  }
}
