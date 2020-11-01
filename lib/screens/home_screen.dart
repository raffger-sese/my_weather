/* --------------------- Flutter -------------------- */
import 'package:flutter/material.dart';
/* --------------------- 3rd Party ------------------ */
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
/* -------------------- Actions --------------------- */
import '../actions/auth_actions.dart';
/* --------------------- Models --------------------- */
import '../models/states/app_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      onInit: (Store<AppState> store) => store.dispatch(AppStarted()),
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return Container(
          child: viewModel.rootContainer,
        );
      },
    );
  }
}

class _ViewModel {
  final Widget rootContainer;

  _ViewModel({
    @required this.rootContainer,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      rootContainer: store.state.navState.rootContainer,
    );
  }
}
