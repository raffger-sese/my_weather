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
  Color lightGreyColor2;
  Color appOtherMessageTextColor; // blue
  Color appOtherMessageBackgroundColor; // accent blue
  Color appOwnMessageBackgroundColor;
  Color alertColor;
  Color tagColor;

  Color groupColor2;
  Color groupColor3;
  Color groupColor4;

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

  TextStyle h3;
  TextStyle h3White;
  TextStyle h3Active;
  TextStyle h3Accent;
  TextStyle h3AntiAccent;
  TextStyle h3Blue;

  TextStyle text;
  TextStyle textBold;
  TextStyle textHint;
  TextStyle textWhite;

  TextStyle textLessImportant;
  TextStyle textLessImportantBold;

  TextStyle textLessImportantAccent;
  TextStyle textLessImportantAntiAccent;
  TextStyle textLessImportantMidGrey;

  TextStyle textSmall;

  TextStyle primaryButtonText;
  TextStyle secondaryButtonText;

  ThemeData appTheme;

  AppTheme._internal() {
    appBackgroundColor = Colors.white;
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

    appOtherMessageTextColor = Color(0xFF0042D0); // blue
    appOtherMessageBackgroundColor = Color(0xFFE5EAFF); // accent blue
    appOwnMessageBackgroundColor = Color(0xFFFFF7BA);
    alertColor = Color(0xFFFF5766); // red
    tagColor = Color(0xFFDFDFDF); // +1 are going

    lightGreyColor2 = Color(0xFFF8F8F8); // event detail background

    groupColor2 = Color(0xFFE2B5FF); //purple
    groupColor3 = Color(0xFFFDECA2); //yellow
    groupColor4 = Color(0xFF7AFFC9); //green

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

    h3 = TextStyle(
      color: textColor,
      fontSize: 16.0,
      fontFamily: primaryFont,
      fontWeight: FontWeight.w500,
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
      color: appBackgroundColor,
      fontSize: 16.0,
      fontFamily: primaryFont,
      fontWeight: FontWeight.w500,
    );

    h3Active = TextStyle(
      color: activeColor,
      fontSize: 16.0,
      fontFamily: primaryFont,
      fontWeight: FontWeight.w500,
    );

    h3Accent = TextStyle(
      color: accentColor,
      fontSize: 16.0,
      fontFamily: primaryFont,
      fontWeight: FontWeight.w500,
    );

    h3AntiAccent = TextStyle(
      color: antiAccentColor,
      fontSize: 16.0,
      fontFamily: primaryFont,
      fontWeight: FontWeight.w500,
    );

    h3Blue = TextStyle(
      color: Color(0xFF271E6F),
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

    textBold = TextStyle(
      color: textColor,
      height: 1.1,
      fontSize: 16.0,
      fontFamily: primaryFont,
      fontWeight: FontWeight.w700,
    );

    textHint = TextStyle(
      color: textHintColor,
      height: 1.1,
      fontSize: 16.0,
      fontFamily: primaryFont,
    );

    textWhite = TextStyle(
      color: appBackgroundColor,
      height: 1.1,
      fontSize: 16.0,
      fontFamily: secondaryFont,
    );

    textLessImportant = TextStyle(
      color: midGreyColor,
      fontSize: 13.0,
      fontFamily: secondaryFont,
    );

    textLessImportantAccent = TextStyle(
      color: accentColor,
      fontSize: 14.0,
      fontFamily: secondaryFont,
    );

    textLessImportantAntiAccent = TextStyle(
      color: antiAccentColor,
      fontSize: 14.0,
      fontFamily: secondaryFont,
    );

    textLessImportantBold = TextStyle(
      color: midGreyColor,
      fontSize: 12.0,
      fontFamily: secondaryFont,
      fontWeight: FontWeight.w700,
    );

    textSmall = textLessImportant = TextStyle(
      color: textHintColor,
      fontSize: 10.0,
      fontFamily: secondaryFont,
    );

    textLessImportantMidGrey = TextStyle(
      color: textColor,
      fontSize: 12.0,
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
