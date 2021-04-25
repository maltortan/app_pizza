import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pizzaaa/auth/authentication_service.dart';
import 'package:pizzaaa/screens/pizzaScreen.dart';
import 'package:provider/provider.dart';

class Favourites extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
        padding: EdgeInsets.only(top: 60),
    child: ListView.builder(
        itemCount: context.read<AuthenticationService>().favList().length,
        itemBuilder: (context, index) {
          List<int> data = context.read<AuthenticationService>().favList();
          print(data);
          int track = data[index];
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
                                Image.asset(context.read<AuthenticationService>().pizzaList[track-1].img,
                                  height: 80,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      context.read<AuthenticationService>().pizzaList[track-1].title,
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
                                            context.read<AuthenticationService>().pizzaList[track-1].id,
                                            context.read<AuthenticationService>().pizzaList[track-1].img, context.read<AuthenticationService>().pizzaList[index].title,
                                            context.read<AuthenticationService>().pizzaList[track-1].rating, context.read<AuthenticationService>().pizzaList[index].price,
                                            context.read<AuthenticationService>().pizzaList[track-1].details)

                                ),
                                )),
                      )
                  )
              )
          );
        }),
    )
    );
  }
}
