import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pizzaaa/auth/authentication_service.dart';

import 'package:provider/provider.dart';

import 'appBar.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(children: [
            FrosAppbar(
              title: Text(
                'Orders',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 60, left: 10, right: 10),
              child: ListView.builder(
                  itemCount:
                      context.read<AuthenticationService>().cartList().length,
                  itemBuilder: (context, index) {
                    List<int> data =
                        context.read<AuthenticationService>().cartList();
                    List<int> price =
                        context.read<AuthenticationService>().cartPrice();

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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    context
                                        .read<AuthenticationService>()
                                        .pizzaList[track - 1]
                                        .img,
                                    height: 80,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        context
                                            .read<AuthenticationService>()
                                            .pizzaList[track - 1]
                                            .title,
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      Text(
                                        'RS ' + price[index].toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.yellowAccent),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: InkWell(
                                      child: Icon(
                                        Icons.delete_forever,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          context
                                              .read<AuthenticationService>()
                                              .remCart(
                                                  data[index], price[index]);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                  }),
            )
          ])),
    );
  }
}
