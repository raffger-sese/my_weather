import 'package:flutter/material.dart';

import '../../containers/home/home_container.dart';

@immutable
class NavState {
  final int selectedBottomNav;
  final Widget rootContainer;

  NavState({
    @required this.selectedBottomNav,
    @required this.rootContainer,
  });

  factory NavState.initial() {
    return NavState(
      selectedBottomNav: 0,
      rootContainer: HomeContainer(),
    );
  }

  NavState copyWith({
    int selectedBottomNav,
    Widget rootContainer,
  }) {
    return NavState(
      selectedBottomNav: selectedBottomNav ?? this.selectedBottomNav,
      rootContainer: rootContainer ?? this.rootContainer,
    );
  }
}
