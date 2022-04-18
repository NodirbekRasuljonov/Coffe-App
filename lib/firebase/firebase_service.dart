import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MyFireBaseService {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseStorage storage=FirebaseStorage.instance;
  static FirebaseFirestore store=FirebaseFirestore.instance;
  

}
