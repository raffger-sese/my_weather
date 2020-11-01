/* --------------------- Flutter -------------------- */
import 'package:flutter/material.dart';
/* --------------------- Common --------------------- */
import '../common/constants.dart';
/* --------------------- Screens -------------------- */
import '../screens/home_screen.dart';
/* -------------------- Containers ------------------ */
import '../containers/bottom_nav.dart';

class RootScreen extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: HomeScreen(),
      bottomNavigationBar: BottomNav(),
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetName.MY_WEATHER_ICON,
            fit: BoxFit.contain,
            height: 32,
          )
        ],
      ),
    );
  }
}
