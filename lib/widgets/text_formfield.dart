import 'package:coffeapp/core/constants/color_const.dart';
import 'package:coffeapp/core/constants/my_radius.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String? hintext;
  TextEditingController controller;
  MyTextField({Key? key,this.hintext,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText:hintext,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: MyColorConst.kPrimaryColor),
          borderRadius: BorderRadius.circular(MyRadius.medium),
        ),
      ),
    );
  }
}
