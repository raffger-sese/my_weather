/* --------------------- Flutter -------------------- */
import 'package:flutter/material.dart';
/* --------------------- 3rd Party ------------------ */
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
/* --------------------- Common --------------------- */
import '../../common/components/app_custom_button.dart';
/* -------------------- Actions --------------------- */
import '../../actions/auth_actions.dart';
/* --------------------- Models --------------------- */
import '../../models/states/app_state.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return AppCustomButton(text: "Logout", onTap: viewModel.onPressed);
      },
    );
  }
}

class _ViewModel {
  final Function() onPressed;

  _ViewModel({this.onPressed});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(onPressed: () {
      store.dispatch(UserLogout());
    });
  }
}
