import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeapp/firebase/firebase_service.dart';
import 'package:flutter/cupertino.dart';

class CoffeeUpload extends ChangeNotifier {
  uploadCoffeeToFireStore({name, price, context}) async {
    print('salom');
    await MyFireBaseService.store.collection('coffee').add({
      'name': name,
      'price': price,
      'created_at': FieldValue.serverTimestamp(),
    });
    notifyListeners();
    Navigator.pop(context);
  }

}
