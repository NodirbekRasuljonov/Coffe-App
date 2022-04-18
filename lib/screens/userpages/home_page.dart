import 'package:coffeapp/provider/text_field_provider.dart';
import 'package:coffeapp/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          context: context,
          title: 'Cat Coffee App',
          function: () {
            context.read<MytextFieldProvider>().signOut(context: context);
          }),
    );
  }
}
