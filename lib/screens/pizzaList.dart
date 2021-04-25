import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzaaa/model/pizzaModel.dart';
import 'package:pizzaaa/screens/pizzaScreen.dart';

class PizzaList extends StatefulWidget {
  @override
  _PizzaListState createState() => _PizzaListState();
}

class _PizzaListState extends State<PizzaList> {
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


  List<PizzaModel> parsePizza(dynamic responseBody) {

    final parsed = jsonDecode(responseBody);


    return parsed.map<PizzaModel>((json) => PizzaModel.fromJson(json));
  }

  Future<List<PizzaModel>> fetchList() async {

    dynamic response = pizzaList;

    return parsePizza(response);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.only(top: 60,left: 10,right: 10),
      child:  ListView.builder(
          itemCount: pizzaList.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.only(top: 5),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: new BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: new Container(
                          decoration: new BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                          ),
                          child: InkWell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(pizzaList[index].img,
                                    height: 80,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        pizzaList[index].title,
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      Text(
                                        'Pizza',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.yellowAccent),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                  ),


                                ],
                              ),
                              onTap: () =>
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          PizzaScreen(
                                              pizzaList[index].id,
                                              pizzaList[index].img,
                                              pizzaList[index].title,
                                              pizzaList[index].rating,
                                              pizzaList[index].price,
                                              pizzaList[index].details)

                                  ),
                                  )),
                        )
                    )
                )
            );
          })


    ));
  }
}
