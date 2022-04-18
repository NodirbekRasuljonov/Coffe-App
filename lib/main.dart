import 'package:coffeapp/core/components/theme_comp.dart';
import 'package:coffeapp/provider/coffe_provider.dart';
import 'package:coffeapp/provider/coffee_upload.dart';
import 'package:coffeapp/provider/login_provider.dart';
import 'package:coffeapp/provider/text_field_provider.dart';
import 'package:coffeapp/routes/my_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MytextFieldProvider(),
        ),
        ChangeNotifierProvider(
          create: (contex) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CoffeeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CoffeeUpload(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyRoute _myroute = MyRoute();
    return MaterialApp(
      title: 'Cat Coffee App',
      theme: MyThemeComp.mytheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _myroute.myRoute,
      initialRoute: context.watch<LoginProvider>().route,
    );
  }
}
