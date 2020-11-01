import 'package:flutter/material.dart';
import 'package:my_weather/common/app_theme.dart';
import 'package:my_weather/common/components/app_custom_button.dart';
import 'package:my_weather/common/constants.dart';
import 'package:my_weather/containers/auth_loading_indicator.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../actions/auth_actions.dart';
import '../../models/states/app_state.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Stack(alignment: Alignment.center, children: [
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                _buildAppLogo(),
                _buildWelcomeMessage(),
                _buildGithubLoginButton(),
              ],
            ),
            AuthLoadingIndicator()
          ]),
        ));
  }

  Widget _buildAppLogo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Image.asset(
          AssetName.MY_WEATHER_LOGO,
          fit: BoxFit.fitHeight,
          height: 200,
        ),
      ),
    );
  }

  Widget _buildWelcomeMessage() {
    return Padding(
      padding: const EdgeInsets.only(top: 58.0),
      child: Center(
        child: Container(
          child: Text(
            Labels.HELLO,
            style: AppTheme.instance.h1,
          ),
        ),
      ),
    );
  }

  Widget _buildGithubLoginButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: StoreConnector<AppState, OnGithubLoginCallback>(
          converter: (Store<AppState> store) {
        return () {
          store.dispatch(UserGithubLoginRequest());
        };
      }, builder: (BuildContext context, OnGithubLoginCallback onGithubLogin) {
        return AppCustomButton(
          isPrimary: true,
          textStyle: AppTheme.instance.h3White,
          onTap: () {
            onGithubLogin();
          },
          text: Labels.LOGIN_GITHUB,
        );
      }),
    );
  }

  Widget _showErrorMessage() {
    return StoreConnector<AppState, String>(
        converter: (Store<AppState> store) => store.state.authState.error,
        builder: (BuildContext context, String error) {
          if (error != null) {
            return Text(
              error,
              style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.red,
                  height: 1.0,
                  fontWeight: FontWeight.w300),
            );
          } else {
            return Container();
          }
        });
  }
}

typedef OnGithubLoginCallback = Function();
