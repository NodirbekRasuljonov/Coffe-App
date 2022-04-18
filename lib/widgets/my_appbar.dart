import 'package:coffeapp/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  BuildContext context;
  String title;
  Color? color;
  VoidCallback? function;
  IconData? icon;
  MyAppBar(
      {Key? key,
      required this.context,
      required this.title,
      this.color = MyColorConst.kPrimaryColor,
      this.function,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      title: Text(title),
      backgroundColor: color,
      actions: [
        function != null
            ? IconButton(
                onPressed: function,
                icon: Icon(icon != null ? icon : Icons.logout_outlined))
            : SizedBox()
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * 0.08);
}
