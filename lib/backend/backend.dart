import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizzaaa/model/pizzaModel.dart';

class Backend{


  Backend();

  CollectionReference pizza = FirebaseFirestore.instance.collection('Pizza');
  CollectionReference profile = FirebaseFirestore.instance.collection('Profile');

  readProfile(String uid)async{
    return await profile.doc(uid).get();
  }

  Future<String> addPizza(PizzaModel data) async{
    try{
      await pizza.add(data.toJson());
    }on FirebaseException catch(e){
      print(e.stackTrace);
      return e.message;
    }

  }



}