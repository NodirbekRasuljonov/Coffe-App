import 'package:coffeapp/screens/adminpages/admin_home_page.dart';
import 'package:coffeapp/screens/login_page.dart';
import 'package:coffeapp/screens/userpages/home_page.dart';
import 'package:flutter/material.dart';

class MyRoute {
  Route? myRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        );
      case '/admin':
        return MaterialPageRoute(
          builder: (context) => const AdminHomepage(),
        );
    }
  }
}
