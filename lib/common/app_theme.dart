import 'package:flutter/material.dart';

class AppTheme {
  static final AppTheme instance = AppTheme._internal();

  Color appBackgroundColor;
  Color textColor;
  Color textHintColor;
  Color activeColor;
  Color activeColorLight;
  Color inactiveColor;
  Color accentColor;
  Color antiAccentColor;
  Color regularGreyColor;
  Color midGreyColor;
  Color lightGreyColor;

  String primaryFont;
  String secondaryFont;
  Brightness primaryColorBrightness;
  double borderRadius;
  double tagBorderRadius;

  Color primaryButtonColor;
  Color primaryButtonBorderColor;

  Color secondaryButtonColor;
  Color secondaryButtonBorderColor;

  TextStyle h1;
  TextStyle h1White;
  TextStyle h2;
  TextStyle h2Bold;
  TextStyle h2White;
  TextStyle h3White;
  TextStyle text;
  TextStyle textLessImportant;

  ThemeData appTheme;

  AppTheme._internal() {
    appBackgroundColor = Color(0xFF48C194);
    textColor = Color(0xFF56527B); // regular grey
    textHintColor = Color(0xFF9794AF);
    activeColor = Color(0xFFFF7253); // orange
    activeColorLight = Color(0xFFFFD4C3); // light orange
    inactiveColor = Color(0xFFFFFFFF); // white
    accentColor = Color(0xFF48C194); // green
    antiAccentColor = Color(0xFFFF5766); // reddish
    regularGreyColor = Color(0xFFCECDD5);
    midGreyColor = Color(0xFF766F39); //  chat text
    lightGreyColor = Color(0xFFEFEFEF); // textfield background

    primaryFont = 'SourceSansPro';
    secondaryFont = 'SourceSansPro';
    borderRadius = 5.0;
    tagBorderRadius = 25.0;

    reloadTheme();
  }

  void reloadTheme() {
    primaryColorBrightness = Brightness.light;
    primaryButtonColor = activeColor;
    primaryButtonBorderColor = inactiveColor;

    secondaryButtonColor = inactiveColor;
    secondaryButtonBorderColor = activeColor;

    h1 = TextStyle(
      color: textColor,
      fontSize: 24.0,
      fontFamily: primaryFont,
      fontWeight: FontWeight.w500,
    );

    h2 = TextStyle(
      color: textColor,
      fontSize: 18.0,
      fontFamily: primaryFont,
      fontWeight: FontWeight.w500,
    );

    h2Bold = TextStyle(
      color: textColor,
      fontSize: 18.0,
      fontFamily: primaryFont,
      fontWeight: FontWeight.w700,
    );

    h1White = TextStyle(
      color: appBackgroundColor,
      fontSize: 26.0,
      fontFamily: primaryFont,
      fontWeight: FontWeight.w500,
    );

    h2White = TextStyle(
      color: appBackgroundColor,
      fontSize: 18.0,
      fontFamily: primaryFont,
      fontWeight: FontWeight.w500,
    );

    h3White = TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      fontFamily: primaryFont,
      fontWeight: FontWeight.w500,
    );

    text = TextStyle(
      color: textColor,
      height: 1.1,
      fontSize: 16.0,
      fontFamily: primaryFont,
    );

    textLessImportant = TextStyle(
      color: midGreyColor,
      fontSize: 13.0,
      fontFamily: secondaryFont,
    );

    appTheme = ThemeData(
      primaryColor: textColor,
      backgroundColor: appBackgroundColor,
      brightness: primaryColorBrightness,
      appBarTheme: AppBarTheme(elevation: 0.0, color: appBackgroundColor),
    );
  }

  TextStyle getText(
      {Color color,
      double height = 1.1,
      double fontSize = 16.0,
      String fontFamily,
      bool bold = false}) {
    return TextStyle(
      color: color ?? textColor,
      height: height,
      fontSize: fontSize,
      fontFamily: fontFamily ?? secondaryFont,
      fontWeight: bold ? FontWeight.w700 : FontWeight.normal,
    );
  }
}
