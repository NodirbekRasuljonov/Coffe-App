import 'package:coffeapp/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class MyMessanger {
  static showMyMessanger({required String text, required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: MyColorConst.kPrimaryColor,
      ),
    );
  }
}
