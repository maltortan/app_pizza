import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pizzaaa/auth/authentication_service.dart';

import 'package:pizzaaa/screens/pizzaList.dart';
import 'package:pizzaaa/screens/pizzaScreen.dart';
import 'package:pizzaaa/screens/appBar.dart';

import 'package:provider/provider.dart';

import 'favourites.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    PizzaList(),
    Favourites(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        image: AssetImage('assets/bg1.jpg'),
    fit: BoxFit.cover,
        ),
              ),
          child: Stack(
            children: [

              Container(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
              FrosAppbar(
                title: Text('Pizza App',
                  style: TextStyle(
                      fontSize: 25,
                    color: Colors.white
                  ),),
                leading: 1,
                actions: [
                  IconButton(
                    icon: Icon(Icons.logout),
                    color: Colors.white,
                    onPressed: () {
                      context.read<AuthenticationService>().signOut();
                    },
                  )
                ],

              ),

            ],
          )

      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Pizzas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Favourites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
      ),
    );
  }
}

price(BoxConstraints constraints, String price) {
  return Positioned(
      top: constraints.maxHeight * 0.36,
      left: constraints.maxWidth * 0.78,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: new BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: new Container(
              width: constraints.maxWidth * 0.2,
              height: 50.0,
              decoration: new BoxDecoration(
                color: Colors.yellowAccent.withOpacity(0.5),
              ),
              child: Center(
                child: Text(
                  price,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )));
}

list(BoxConstraints constraints, String itm_name, String rating) {
  return Positioned(
    top: constraints.maxHeight * 0.15,
    left: constraints.maxWidth * 0.35,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: new BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: new Container(
          width: constraints.maxWidth * 0.9,
          height: 200.0,
          decoration: new BoxDecoration(
            color: Colors.white.withOpacity(0.2),
          ),
          child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(constraints.maxWidth * 0.22,
                        constraints.maxHeight * 0.01, 10, 25),
                    child: Icon(
                      Icons.favorite_border_outlined,
                      size: 45,
                      color: Colors.yellow[200],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        itm_name,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[400]),
                      Text(rating),
                    ],
                  )
                ],
              )),
        ),
      ),
    ),
  );
}

image(BoxConstraints constraints, String url) {
  return Positioned(
    left: constraints.maxWidth * 0.23,
    child: Container(
        width: constraints.maxWidth * 0.65,
        child: Column(
          children: [
            Image(image: AssetImage(url)),
          ],
        )),
  );
}
