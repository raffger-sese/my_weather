import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../containers/logout_button.dart';
import '../models/app_state.dart';
import '../models/user.dart';
import '../screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
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
                      _buildAvatar(),
                      _buildHeader(viewModel),
                    ],
                  ),
                ),
              ],
            ),
            _buildLogout(),
          ],
        ),
      ],
    ),
  );
}

Widget _buildLogout() {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[LogoutButton()],
      ),
    ),
  );
}

Widget _buildHeader(_ViewModel viewModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      _buildH1('Hello ${viewModel.user.username ?? ''}!'),
    ],
  );
}

// Todo: Put to a different file to be re-usable
Widget _buildAvatar() {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      width: 60,
      height: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: Colors.grey,
          child: Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}

// Todo: Put to a different file to be re-usable
Widget _buildH1(String text) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.grey,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
    ),
    maxLines: 3,
    overflow: TextOverflow.ellipsis,
  );
}

// Todo: Put to a different file to be re-usable
Widget _buildH2(String text) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.grey,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    maxLines: 3,
    overflow: TextOverflow.ellipsis,
  );
}

// Todo: Put to a different file to be re-usable
Widget _buildH3(String text) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.grey,
      fontSize: 12.0,
      fontWeight: FontWeight.w300,
    ),
    maxLines: 3,
    overflow: TextOverflow.ellipsis,
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
