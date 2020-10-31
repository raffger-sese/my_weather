import 'package:flutter/material.dart';

import '../app_theme.dart';

class AppCustomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isPrimary;
  final double width;
  final Widget child;
  final double textSize;
  final FontWeight fontWeight;
  final bool isEnabled;
  final TextStyle textStyle;
  final Color borderColor;
  final Color fillColor;

  AppCustomButton(
      {@required this.text,
      @required this.onTap,
      this.isPrimary = true,
      this.width,
      this.child,
      this.textSize,
      this.fontWeight,
      this.isEnabled = true,
      this.textStyle,
      this.borderColor,
      this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        child: FlatButton(
          disabledColor: AppTheme.instance.lightGreyColor,
          color: fillColor != null
              ? fillColor
              : isPrimary
                  ? AppTheme.instance.activeColor
                  : AppTheme.instance.inactiveColor,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppTheme.instance.borderRadius),
              side: BorderSide(
                  color: borderColor ?? AppTheme.instance.activeColor,
                  width: 1.5)),
          onPressed: isEnabled ? onTap : null,
          child: Container(
            child: child ??
                Center(
                  child: Text(
                    text,
                    style: textStyle ?? AppTheme.instance.h3White,
                    textAlign: TextAlign.center,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
