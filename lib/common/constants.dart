class Label {}

class ButtonTitle {}

class Constant {
  static const NAME = "name";
  static const TOKEN = "token";
  static const LOCALE = "locale";
}

class NumConstant {
}

class AssetName {
  static const MY_WEATHER_LOGO = 'assets/icons/my-weather.png';
  static const MY_WEATHER_ICON = 'assets/icons/my-weather.jpg';
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
  static const VIEW_LOC = "Show curent location";
}

class CacheKeys {
  static const TOKEN = 'token';
  static const USER_DATA = 'userData';
}

class URLs {
  static const GITHUB = 'https://github.com/';
}
