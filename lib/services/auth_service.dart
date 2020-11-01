/* --------------------- Flutter -------------------- */
import 'dart:async';
import 'dart:core';
import 'dart:convert';
/* --------------------- 3rd Party ------------------ */
import 'package:http/http.dart' as http;
import 'package:flutter_appauth/flutter_appauth.dart';
/* --------------------- Common --------------------- */
import '../common/constants.dart';
/* --------------------- Models --------------------- */
import '../models/user.dart';

abstract class AuthService {
  Future<User> getUserDetails(String accessToken);
  Future<AuthorizationTokenResponse> loginWithGithub();
}

class AuthServiceImpl implements AuthService {
  Future<AuthorizationTokenResponse> loginWithGithub() async {
    FlutterAppAuth appAuth = FlutterAppAuth();
    AuthorizationTokenResponse result;
    try {
      result = await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          AuthConstants.AUTH0_CLIENT_ID,
          AuthConstants.AUTH0_REDIRECT_URI,
          issuer: 'https://${AuthConstants.AUTH0_DOMAIN}',
          scopes: ['openid', 'profile', 'offline_access'],
        ),
      );
    } catch (e) {
      print(e.message);
      throw Exception('Failed to login via github.');
    }
    return result;
  }

  @override
  Future<User> getUserDetails(String accessToken) async {
    final url = 'https://${AuthConstants.AUTH0_DOMAIN}/userinfo';
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return User.fromGithubJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get user details');
    }
  }
}
