import 'package:flutter/material.dart';
import 'package:my_weather/common/constants.dart';
import 'package:my_weather/containers/bottom_nav.dart';
import 'package:my_weather/screens/home_screen.dart';

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
