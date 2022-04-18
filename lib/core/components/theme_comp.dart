import 'package:coffeapp/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class MyThemeComp {
  static ThemeData  get mytheme =>ThemeData(
    colorScheme: ColorScheme.light(primary: MyColorConst.kPrimaryColor),
    scaffoldBackgroundColor: MyColorConst.kScaffoldColor
  );
}
