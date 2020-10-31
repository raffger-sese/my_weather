import 'package:my_weather/common/constants.dart';
import 'package:my_weather/utils/dependency_locator.dart';
import 'package:my_weather/utils/shared_pref.dart';
import 'package:redux/redux.dart';

import '../actions/auth_actions.dart';
import '../models/app_state.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

class AuthMiddleware {
  AuthService _authService = getIt.get<AuthService>();

  List<Middleware<AppState>> createAuthMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, AppStarted>(_appStarted),
      TypedMiddleware<AppState, UserLoginRequest>(_login),
      TypedMiddleware<AppState, UserGithubLoginRequest>(_loginWithGithub),
      TypedMiddleware<AppState, UserLoginSuccess>(_loginSuccess),
      TypedMiddleware<AppState, UserLogout>(_logout),
    ];
  }

  void _appStarted(
      Store<AppState> store, AppStarted action, NextDispatcher next) async {
    next(action);

    // if (await _hasToken()) {
    //   store.dispatch(UserLoaded(user: await _getUser()));
    // }
  }

  void _loginWithGithub(Store<AppState> store, UserGithubLoginRequest action,
      NextDispatcher next) async {
    next(action);

    try {
      final result = await _authService.loginWithGithub();
      await _persistToken(result.idToken);

      final profile = await _authService.getUserDetails(result.accessToken);
      await _persistUserData(profile);
    } catch (e) {
      print(e);
    }
  }

  void _login(Store<AppState> store, UserLoginRequest action,
      NextDispatcher next) async {
    next(action);
    // Todo: regular login
  }

  void _loginSuccess(Store<AppState> store, UserLoginSuccess action,
      NextDispatcher next) async {
    next(action);

    store.dispatch(UserLoaded(user: action.user));
  }

  void _logout(
      Store<AppState> store, UserLogout action, NextDispatcher next) async {
    await _deleteToken();

    next(action);
  }

  /// HELPER FUNCTIONS

  Future<void> _persistUserData(dynamic user) async {
    SharedPref.instance.save(CacheKeys.USER_DATA, user);
  }

  Future<void> _persistToken(String token) async {
    SharedPref.instance.save(CacheKeys.TOKEN, token);
  }

  Future<String> _getToken() async {
    return SharedPref.instance.read(CacheKeys.TOKEN);
  }

  Future<User> _getUser() async {
    return SharedPref.instance.read(CacheKeys.USER_DATA);
  }

  Future<bool> _hasToken() async {
    final token = await _getToken();
    if (token != '') {
      return true;
    } else {
      return false;
    }
  }

  Future<void> _deleteToken() async {
    SharedPref.instance.remove(CacheKeys.USER_DATA);
  }
}
