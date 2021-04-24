// Import the firebase_core and cloud_firestore plugin


import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Backend{


  Backend();


  CollectionReference professionals = FirebaseFirestore.instance.collection('professional');
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference services = FirebaseFirestore.instance.collection('Services');
  CollectionReference profile = FirebaseFirestore.instance.collection('Profile');

  // Future<String> addProfessional(ProfessionModel data) async {
  //   // Call the user's CollectionReference to add a new user
  //   try {
  //     await professionals
  //         .add(data.toMap())//model mapping
  //         .then((value) => print("Professional Added"));
  //   } on FirebaseException catch (e) {
  //     print(e.stackTrace);
  //     return e.message;
  //   }
  // }


  readProfile(String uid)async{
    return await profile.doc(uid).get();
  }




}