
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizzaaa/backend/firebase.dart';
import 'package:pizzaaa/model/pizzaModel.dart';

class AuthenticationService extends ChangeNotifier{
  final FirebaseAuth _firebaseAuth;
  List<PizzaModel> pizzaList = [
    PizzaModel(
        id: 1,
        title: 'Cheese Pizza',
        price: '250',
        rating: '4.20',
        img: 'assets/pizza2.png',
        details: 'Test Test Test Test'
    ),
    PizzaModel(
        id: 2,
        title: 'Chicken Pizza',
        price: '350',
        rating: '3.50',
        img: 'assets/pizza1.png',
        details: 'Test Test Test Test'
    ),
    PizzaModel(
        id: 3,
        title: 'Sausage Pizza',
        price: '450',
        rating: '4.50',
        img: 'assets/pizza3.png',
        details: 'Test Test Test Test'
    ),

  ];
  List<int> _favourites= [
  ];
  List<int> _cart = [
  ];
  List<int> _cartPrice = [
  ];

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

    }on FirebaseAuthException catch(e){

      return e.message;
    }
  }
  Future<String> signUp({String email, String password}) async{
    try {

      await   _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      userSetup(email);
    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }
  listPizza(){
    return pizzaList;
  }
  List<int> favList(){

    return _favourites;
  }
  bool _state = false;
  bool get counterState => _state;

  toggle(){
    _state = !_state;
    notifyListeners();
  }

  void addFav(int id){
    _favourites.add(id);
    print(_favourites);
  }

  void remFav(int id){
    _favourites.remove(id);
    print(_favourites);
  }

  List<int> cartList(){
    return _cart;
  }
  List<int> cartPrice(){
    return _cartPrice;
  }
  void addCart(int id, int price){
    _cart.add(id);
    _cartPrice.add(price);
    print(_cart + _cartPrice);
  }

  void remCart(int id, int price){
    _cart.remove(id);
    _cartPrice.remove(price);
    print(_cart);
  }
}