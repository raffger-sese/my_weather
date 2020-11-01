/* --------------------- Flutter -------------------- */
import 'package:flutter/material.dart';
/* --------------------- 3rd Party ------------------ */
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
/* --------------------- Common --------------------- */
import '../common/app_theme.dart';
/* --------------------- Models --------------------- */
import '../models/states/app_state.dart';

class AuthLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel viewModel) {
          if (viewModel.isLoading) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppTheme.instance.lightGreyColor.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}

class _ViewModel {
  final bool isLoading;

  _ViewModel({this.isLoading});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isLoading: store.state.authState.isLoading,
    );
  }
}
