import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_weather/common/app_theme.dart';
import 'package:my_weather/common/components/app_avatar.dart';
import 'package:redux/redux.dart';

import '../../containers/auth/logout_button.dart';
import '../../models/app_state.dart';
import '../../models/user.dart';
import '../../screens/login_screen.dart';

class ProfileContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        if (viewModel.isAuthenticated) {
          return _buildBody(viewModel);
        } else {
          return LoginScreen();
        }
      },
    );
  }
}

Widget _buildBody(_ViewModel viewModel) {
  return Container(
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      _buildAvatar(viewModel),
                      _buildHeader(viewModel),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            _buildLogout(),
          ],
        ),
      ],
    ),
  );
}

Widget _buildLogout() {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: Stack(
      alignment: Alignment.topRight,
      children: <Widget>[LogoutButton()],
    ),
  );
}

Widget _buildHeader(_ViewModel viewModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        viewModel.user.fullName,
        style: AppTheme.instance.text,
      ),
    ],
  );
}

// Todo: Put to a different file to be re-usable
Widget _buildAvatar(_ViewModel viewModel) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      width: 60,
      height: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          color: Colors.grey,
          child: AppAvatar(user: viewModel.user),
        ),
      ),
    ),
  );
}

class _ViewModel {
  final bool isAuthenticated;
  final User user;

  _ViewModel({
    @required this.isAuthenticated,
    @required this.user,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isAuthenticated: store.state.authState.isAuthenticated,
      user: store.state.authState.user,
    );
  }
}
