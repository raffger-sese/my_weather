import 'package:flutter/material.dart';
import 'package:my_weather/models/user.dart';
import 'package:my_weather/utils/string_util.dart';

import '../app_theme.dart';

class AppAvatar extends StatelessWidget {
  final User user;
  final double size;
  final TextStyle initialTextStyle;
  final Color fillColor;
  final Color borderColor;
  final bool hasBorder;

  AppAvatar(
      {this.user,
      this.size,
      this.initialTextStyle,
      this.fillColor,
      this.borderColor,
      this.hasBorder = false});

  @override
  Widget build(BuildContext context) {
    return user.profilePic == null || user.profilePic.isEmpty
        ? Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: fillColor != null
                      ? fillColor
                      : AppTheme.instance.inactiveColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: borderColor != null
                        ? borderColor
                        : AppTheme.instance.inactiveColor,
                    width: 1.0,
                  ),
                ),
              ),
              Container(
                  width: hasBorder ? size - 4 : size,
                  height: hasBorder ? size - 4 : size,
                  child: Center(
                    child: Text(
                      StringUtil.instance.getInitials(user.fullName),
                      textAlign: TextAlign.center,
                      style: initialTextStyle,
                    ),
                  )),
            ],
          )
        : Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: fillColor != null
                      ? fillColor
                      : AppTheme.instance.activeColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: borderColor != null
                        ? borderColor
                        : AppTheme.instance.regularGreyColor,
                    width: 1.0,
                  ),
                ),
              ),
              Container(
                width: hasBorder ? size - 4 : size,
                height: hasBorder ? size - 4 : size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(user.profilePic),
                  ),
                ),
              ),
            ],
          );
  }
}
