import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_weather/common/app_theme.dart';
import 'package:redux/redux.dart';

import '../actions/nav_actions.dart';
import '../models/app_state.dart';

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return BottomNavigationBar(
          backgroundColor: AppTheme.instance.appBackgroundColor,
          currentIndex: viewModel.selectedBottomNav,
          onTap: viewModel.onBottomNavSelected,
          items: _getItems(),
        );
      },
    );
  }

  List<BottomNavigationBarItem> _getItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.cloud),
        label: 'Weather',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.supervised_user_circle),
        label: 'Profile',
      ),
    ];
  }
}

class _ViewModel {
  final int selectedBottomNav;
  final Function(int) onBottomNavSelected;

  _ViewModel({
    @required this.selectedBottomNav,
    @required this.onBottomNavSelected,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      selectedBottomNav: store.state.navState.selectedBottomNav,
      onBottomNavSelected: (int index) =>
          store.dispatch(ChangeBottomNavAction(index: index)),
    );
  }
}
