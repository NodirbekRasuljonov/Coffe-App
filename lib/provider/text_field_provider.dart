import 'package:coffeapp/firebase/firebase_service.dart';
import 'package:coffeapp/services/firebase_service.dart';
import 'package:coffeapp/widgets/my_messsanger.dart';
import 'package:flutter/cupertino.dart';

class MytextFieldProvider extends ChangeNotifier {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();

  Future signUp({required BuildContext context}) async {
    try {
      await MyFireBaseService.auth.createUserWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
      MyMessanger.showMyMessanger(text: 'Welcome', context: context);
    } catch (e) {
      MyMessanger.showMyMessanger(text: e.toString(), context: context);
    }
  }

  Future singIn({required BuildContext context}) async {
    try {
      if(globalKey.currentState!.validate()){
        await MyFireBaseService.auth.signInWithEmailAndPassword(
        email: emailcontroller.text, password: passwordcontroller.text);
        if(emailcontroller.text=='admin@gmail.com'&& passwordcontroller.text=='admin11'){
          Navigator.pushNamedAndRemoveUntil(context, '/admin', (route) => false);
        }
        else{
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }
        // MyMessanger.showMyMessanger(text: 'Signed In', context: context);
      }else{
        MyMessanger.showMyMessanger(text: 'Fill all fields', context: context);
      }
    } catch (e) {
      MyMessanger.showMyMessanger(text: e.toString(), context: context);
    }
  }

  Future signOut({required BuildContext context} )async{
    await MyFireBaseService.auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
