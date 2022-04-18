import 'package:coffeapp/firebase/firebase_service.dart';
import 'package:coffeapp/services/firebase_service.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider(){
    checkLogin();
  }
  String route = '/login';
  checkLogin() {
    if (MyFireBaseService.auth.currentUser != null) {
      if (MyFireBaseService.auth.currentUser!.email == 'admin@gmail.com') {
        MyFireBaseService.auth.currentUser != null ? route='/admin': route='/login';
      } else {
        MyFireBaseService.auth.currentUser != null ? route='/home':route='/login' ;
      }
    notifyListeners();
    }
  }
}
