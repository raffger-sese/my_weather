/* --------------------- Flutter -------------------- */
import 'package:meta/meta.dart';
/* --------------------- Models --------------------- */
import '../states/home_state.dart';
import '../states/auth_state.dart';
import '../states/nav_state.dart';

@immutable
class AppState {
  final AuthState authState;
  final NavState navState;
  final HomeState homeState;

  AppState({
    @required this.authState,
    @required this.navState,
    @required this.homeState,
  });

  factory AppState.initial() {
    return AppState(
      authState: AuthState.initial(),
      navState: NavState.initial(),
      homeState: HomeState.initial(),
    );
  }
}
