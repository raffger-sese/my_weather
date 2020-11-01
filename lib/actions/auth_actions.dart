/* --------------------- Models --------------------- */
import '../models/user.dart';

class AppStarted {}

class UserGithubLoginRequest {}

class UserLoginSuccess {
  final String token;
  final User user;

  UserLoginSuccess({this.token, this.user});
}

class UserLoaded {
  final User user;
  final String token;

  UserLoaded({this.user, this.token});
}

class UserLoginFailure {
  final String error;

  UserLoginFailure({this.error});
}

class UserLogout {}
