/* --------------------- Flutter -------------------- */
import 'package:flutter/material.dart';
/* --------------------- 3rd Party ------------------ */
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
/* --------------------- Common --------------------- */
import '../../common/app_theme.dart';
import '../../common/components/app_avatar.dart';
import '../../common/components/app_custom_button.dart';
import '../../common/constants.dart';
/* -------------------- Actions --------------------- */
import '../../actions/home_action.dart';
/* --------------------- Models --------------------- */
import '../../models/user.dart';
import '../../models/states/app_state.dart';

/* -------------------- Utilities ------------------- */
import '../../utils/string_util.dart';

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      onInit: (Store<AppState> store) => store.dispatch(RetrieveLocation()),
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
        viewModel.user != null
            ? 'Hello ${viewModel.user.fullName ?? ''}!'
            : 'Hello there!',
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
        child: GestureDetector(
          onTap: viewModel.user != null
              ? () {
                  StringUtil.instance.launchURL(
                      '${StringUtil.instance.createGithublink(viewModel.user.username)}');
                }
              : null,
          child: Text(
            viewModel.user != null
                ? StringUtil.instance.createGithublink(viewModel.user.username)
                : URLs.GITHUB,
            style: AppTheme.instance.text,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: AppCustomButton(
          isPrimary: true,
          textStyle: AppTheme.instance.h3White,
          onTap: () {
            viewModel.isLocationShown
                ? viewModel.onHideLocation()
                : viewModel.onShowLocation();
          },
          text: viewModel.isLocationShown ? Labels.HIDE_LOC : Labels.VIEW_LOC,
        ),
      ),
      Visibility(
          visible: viewModel.isLocationShown,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Latitude:',
                  style: AppTheme.instance.textLessImportant,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  '${viewModel.latitude}',
                  style: AppTheme.instance.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Longitude:',
                  style: AppTheme.instance.textLessImportant,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  '${viewModel.longitude}',
                  style: AppTheme.instance.text,
                ),
              ),
            ],
          )),
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
  final Function() onShowLocation;
  final Function() onHideLocation;
  final double longitude;
  final double latitude;
  final bool isLocationShown;

  _ViewModel({
    @required this.user,
    this.onShowLocation,
    this.onHideLocation,
    this.longitude,
    this.latitude,
    this.isLocationShown,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      user: store.state.authState.user,
      isLocationShown: store.state.homeState.isLocationShown,
      latitude: store.state.homeState.latitude,
      longitude: store.state.homeState.longitude,
      onShowLocation: () {
        store.dispatch(ShowLocation(isShown: true));
      },
      onHideLocation: () {
        store.dispatch(ShowLocation(isShown: false));
      },
    );
  }
}
