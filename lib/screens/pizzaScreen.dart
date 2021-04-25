import 'dart:ui';
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:pizzaaa/auth/authentication_service.dart';
import 'package:pizzaaa/screens/appBar.dart';

import 'cart.dart';
import 'orderPizza.dart';

class PizzaScreen extends StatefulWidget {
  int id;
  String img;
  String title;
  String rating;
  String price;
  String details;

  PizzaScreen(
      this.id, this.img, this.title, this.rating, this.price, this.details);

  @override
  _PizzaScreenState createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final AuthenticationService moreBloc =
        Provider.of<AuthenticationService>(context);

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: LayoutBuilder(builder: (context, constraints) {
            double top = constraints.maxHeight * 1.5;
            double left = constraints.maxWidth;
            return Stack(
              children: [
                FrosAppbar(
                  title: Text(
                    widget.title,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  leading: 1,
                  actions: [
                    IconButton(
                      icon: Icon(Icons.backspace),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    child: SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Container(
                        child: Stack(
                          children: [
                            Positioned(
                              top: top * 0.15,
                              left: left * 0.35,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: new BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: new Container(
                                    width: constraints.maxWidth * 0.9,
                                    height: 200.0,
                                    decoration: new BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  constraints.maxWidth * 0.22,
                                                  constraints.maxHeight * 0.01,
                                                  10,
                                                  25),
                                              child: InkWell(
                                                child: (context
                                                            .read<
                                                                AuthenticationService>()
                                                            .favList()
                                                            .contains(
                                                                widget.id) !=
                                                        false)
                                                    ? Icon(
                                                        Icons.favorite_outlined,
                                                        size: 45,
                                                        color:
                                                            Colors.yellow[200],
                                                      )
                                                    : Icon(
                                                        Icons
                                                            .favorite_outline_outlined,
                                                        size: 45,
                                                        color:
                                                            Colors.yellow[200],
                                                      ),
                                                onTap: () {
                                                  moreBloc.toggle();
                                                  if (context
                                                          .read<
                                                              AuthenticationService>()
                                                          .favList()
                                                          .contains(
                                                              widget.id) !=
                                                      true) {
                                                    setState(() {
                                                      context
                                                          .read<
                                                          AuthenticationService>()
                                                          .addFav(widget.id);
                                                    });

                                                  } else {
                                                    setState(() {
                                                      context
                                                          .read<
                                                          AuthenticationService>()
                                                          .remFav(widget.id);
                                                    });

                                                  }
                                                },
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  widget.title,
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.star,
                                                    color: Colors.yellow[400]),
                                                Text(
                                                  widget.rating,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                top: top * 0.28,
                                left: left * 0.78,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: new BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: new Container(
                                        width: constraints.maxWidth * 0.2,
                                        height: 50.0,
                                        decoration: new BoxDecoration(
                                          color: Colors.yellowAccent
                                              .withOpacity(0.5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Rs ' + widget.price,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ))),

                            //pizza Image
                            Positioned(
                              top: top * 0.06,
                              left: constraints.maxWidth * 0.23,
                              child: Container(
                                  width: constraints.maxWidth * 0.65,
                                  child: Column(
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          widget.img,
                                        ),
                                        height: 200,
                                      ),
                                    ],
                                  )),
                            ),
                            Positioned(
                              top: top * 0.34,
                              left: left * 0.05,
                              child: Stack(
                                children: [
                                  GlassmorphicContainer(
                                      height: constraints.maxHeight * 0.4,
                                      width: constraints.maxWidth * 0.9,
                                      borderRadius:
                                          constraints.maxHeight * 0.02,
                                      blur: 5,
                                      alignment: Alignment.center,
                                      border: 2,
                                      linearGradient: LinearGradient(
                                          colors: [
                                            Colors.white.withOpacity(0.4),
                                            Colors.white38.withOpacity(0.2)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                      borderGradient: LinearGradient(colors: [
                                        Colors.white24.withOpacity(0.2),
                                        Colors.white70.withOpacity(0.2)
                                      ]),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Ingredients',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(padding: EdgeInsets.only(left: 10,right: 10),
                                          child: Text(
                                            '''There are some toppings that should be cooked first before topping a pizza because they won’t cook fully in the oven during the pizza's cooking time. Any raw meat should be fully cooked before adding it as a topping.
                                    ''',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 19,
                                                color: Colors.white70),
                                          ),),
                                        ],
                                      )),
                                  Positioned(
                                    top: constraints.maxHeight * 0.32,
                                    left: constraints.maxWidth * 0.16,
                                    child: Row(

                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 10),
                                        child: ElevatedButton(
                                          child: Text('Order Now'),
                                          onPressed: () {
                                            Navigator.push(
                                                context, MaterialPageRoute(builder: (context) => Cart()));
                                            setState(() {
                                              context
                                                  .read<
                                                  AuthenticationService>()
                                                  .addCart(widget.id,int.parse(widget.price));
                                            });
                                          },
                                        ),),

                                        ElevatedButton(
                                          child: Text('Custom Order'),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  _buildPopupDialog(context),
                                            );

                                          },
                                        ),

                                      ],
                                    )
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Confirm'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Do you want custom pizza?"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrderPizza(widget.id)));


          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Yes'),
        ),
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('No'),
        ),
      ],
    );
  }
}
