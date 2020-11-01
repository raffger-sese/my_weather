import 'package:redux/redux.dart';

import '../actions/auth_actions.dart';
import '../models/states/auth_state.dart';

Reducer<AuthState> authReducer = combineReducers([
  TypedReducer<AuthState, UserGithubLoginRequest>(_userLoginRequestReducer),
  TypedReducer<AuthState, UserLoginSuccess>(_userLoginRequestSuccess),
  TypedReducer<AuthState, UserLoaded>(_userLoaded),
  TypedReducer<AuthState, UserLoginFailure>(_userLoginRequestFailure),
  TypedReducer<AuthState, UserLogout>(_userLogoutReducer),
]);

AuthState _userLoginRequestReducer(
    AuthState state, UserGithubLoginRequest action) {
  return state.copyWith(
    isLoading: true,
  );
}

AuthState _userLoginRequestSuccess(AuthState state, UserLoginSuccess action) {
  return state.copyWith(
    isLoading: false,
    user: action.user,
    token: action.token,
  );
}

AuthState _userLoaded(AuthState state, UserLoaded action) {
  return state.copyWith(
    isLoading: false,
    isAuthenticated: true,
    user: action.user,
    token: action.token,
  );
}

AuthState _userLoginRequestFailure(AuthState state, UserLoginFailure action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
  );
}

AuthState _userLogoutReducer(AuthState state, UserLogout action) {
  return state.copyWith(
    isLoading: false,
    isAuthenticated: false,
    user: null,
  );
}
