class Label {}

class ButtonTitle {}

class Constant {
  static const NAME = "name";
  static const EMAIL = "email";
  static const IMAGE = "image";
  static const UID = "uid";
  static const TOKEN = "token";
  static const LOCALE = "locale";
  static const UPDATEDGROUPS = "updatedGroups";
  static const JOINEDGROUPS = "joinedGroups";
  static const STATUS = "status";
}

class NumConstant {
  static const GROUPS_PER_SET = 7;
  static const BADGE_HEIGHT = 13.0;
  static const BADGE_WIDTH = 14.0;
}

class AssetName {
  static const MY_WEATHER_ICON = 'assets/icons/my-weather.png';
}

class AppRoutes {
  static const HOME = "/";
  static const DASHBOARD_SCREEN = "/dashboard";
}

class AuthConstants {
  static const AUTH0_DOMAIN = 'dev-q710hbr4.us.auth0.com';
  static const AUTH0_CLIENT_ID = 'iDXy1B2M6fA3xky1L0ILiu0W3iZOLP8M';

  static const AUTH0_REDIRECT_URI = 'com.auth0.myweather://login-callback';
  static const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';
}

class Labels {
  static const APP_NAME = 'My Weather';
  static const HELLO = 'Hello World!';
  static const LOGIN_GITHUB = "Login with Github";
}

class CacheKeys {
  static const TOKEN = 'token';
  static const USER_DATA = 'userData';
}
