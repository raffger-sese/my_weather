import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_weather/actions/home_action.dart';
import 'package:my_weather/common/app_theme.dart';
import 'package:my_weather/common/components/app_avatar.dart';
import 'package:my_weather/common/components/app_custom_button.dart';
import 'package:my_weather/common/constants.dart';
import 'package:my_weather/utils/string_util.dart';
import 'package:redux/redux.dart';

import '../../models/app_state.dart';
import '../../models/user.dart';

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return _buildBody(viewModel);
      },
    );
  }
}

Widget _buildBody(_ViewModel viewModel) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildAvatar(viewModel),
          _buildUserInfo(viewModel),
        ],
      ),
    ),
  );
}

Widget _buildUserInfo(_ViewModel viewModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        'Hello ${viewModel.user.fullName ?? ''}!',
        style: AppTheme.instance.h1,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Text(
          'Your github account:',
          style: AppTheme.instance.textLessImportant,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          StringUtil.instance.createGithublink(viewModel.user.username),
          style: AppTheme.instance.text,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: AppCustomButton(
          isPrimary: true,
          textStyle: AppTheme.instance.h3White,
          onTap: () {
            // onGithubLogin();
          },
          text: Labels.VIEW_LOC,
        ),
      ),
    ],
  );
}

// Todo: Put to a different file to be re-usable
Widget _buildAvatar(_ViewModel viewModel) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      width: 120,
      height: 120,
      child: AppAvatar(user: viewModel.user),
    ),
  );
}

class _ViewModel {
  final User user;
  final Function() onPressed;

  _ViewModel({
    @required this.user,
    this.onPressed,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        user: store.state.authState.user,
        onPressed: () {
          store.dispatch(ShowLocation());
        });
  }
}
