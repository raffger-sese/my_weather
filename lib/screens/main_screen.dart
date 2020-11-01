/* --------------------- Flutter -------------------- */
import 'package:flutter/material.dart';
/* --------------------- 3rd Party ------------------ */
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
/* -------------------- Actions --------------------- */
import '../actions/auth_actions.dart';
/* --------------------- Models --------------------- */
import '../models/states/app_state.dart';
/* --------------------- Screens -------------------- */
import 'login_screen.dart';
import 'root_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, _ViewModel>(
        onInit: (Store<AppState> store) => store.dispatch(AppStarted()),
        distinct: true,
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel viewModel) {
          return Container(
            child: viewModel.rootScreen,
          );
        },
      ),
    );
  }
}

class _ViewModel {
  final Widget rootScreen;

  _ViewModel({
    @required this.rootScreen,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        rootScreen: store.state.authState.user != null &&
                store.state.authState.isAuthenticated
            ? RootScreen()
            : LoginScreen());
  }
}
