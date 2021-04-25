import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:pizzaaa/auth/authentication_service.dart';
import 'package:provider/provider.dart';
import 'appBar.dart';
import 'cart.dart';

class OrderPizza extends StatefulWidget {
  final int id;

  OrderPizza(this.id);

  @override
  _OrderPizzaState createState() => _OrderPizzaState();
}

class _OrderPizzaState extends State<OrderPizza> {
  TextEditingController nameController = TextEditingController();
  int _total = 0;
  int _prevVal = 0;
  double _netTotal = 0;
  int _radioValue1;
  int _counter = 1;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          _total = _total + 250 - _prevVal;
          _prevVal = 250;
          break;
        case 1:
          _total = _total + 450 - _prevVal;
          _prevVal = 450;
          break;
        case 2:
          _total = _total + 650 - _prevVal;
          _prevVal = 650;
          break;
      }
    });
  }

  final _formKey = GlobalKey<FormState>();
  bool _isSelected = false;
  bool _isSelected1 = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected4 = false;

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
        child: Container(
          child: LayoutBuilder(builder: (context, constraints) {
            return Stack(
              children: [
                FrosAppbar(
                  title: Text(
                    'Pizza App',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  leading: 1,
                  actions: [
                    IconButton(
                      icon: Icon(Icons.close),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Positioned(
                  top: constraints.maxHeight * 0.15,
                  left: 0,
                  child: GlassmorphicContainer(
                    height: constraints.maxHeight * 0.8,
                    width: constraints.maxWidth,
                    borderRadius: constraints.maxHeight * 0.02,
                    blur: 0.1,
                    border: 2,
                    linearGradient: LinearGradient(colors: [
                      Colors.white.withOpacity(0.4),
                      Colors.white38.withOpacity(0.2)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderGradient: LinearGradient(colors: [
                      Colors.white24.withOpacity(0.2),
                      Colors.white70.withOpacity(0.2)
                    ]),
                    child: Container(
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Divider(),
                                Text(
                                  'Select Topping',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22),
                                ),
                                new Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    LabeledCheckbox(
                                      label: 'Chicken Sausage ',
                                      price: 'Rs 80  ',
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      value: _isSelected,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          (_isSelected)
                                              ? _total = _total - 80
                                              : _total = _total + 80;
                                          _isSelected = newValue;
                                        });
                                      },
                                    ),
                                    LabeledCheckbox(
                                      label: 'Tomato ',
                                      price: 'Rs 50  ',
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      value: _isSelected1,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          (_isSelected1)
                                              ? _total = _total - 50
                                              : _total = _total + 50;
                                          _isSelected1 = newValue;
                                        });
                                      },
                                    ),
                                    LabeledCheckbox(
                                      label: 'Sweet Corn ',
                                      price: 'Rs 90  ',
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      value: _isSelected2,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          (_isSelected2)
                                              ? _total = _total - 90
                                              : _total = _total + 90;
                                          _isSelected2 = newValue;
                                        });
                                      },
                                    ),
                                    LabeledCheckbox(
                                      label: 'Red Pepperica ',
                                      price: 'Rs 45  ',
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      value: _isSelected3,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          (_isSelected3)
                                              ? _total = _total - 45
                                              : _total = _total + 45;
                                          _isSelected3 = newValue;
                                        });
                                      },
                                    ),
                                    LabeledCheckbox(
                                      label: 'Red Capsicum ',
                                      price: 'Rs 55  ',
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      value: _isSelected4,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          (_isSelected4)
                                              ? _total = _total - 55
                                              : _total = _total + 55;
                                          _isSelected4 = newValue;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Text(
                                  'Size Of Pizza',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22),
                                ),
                                new Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        new Radio(
                                          value: 0,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                          activeColor: Colors.white,
                                        ),
                                        new Text(
                                          'Small',
                                          style: new TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                        Spacer(),
                                        new Text(
                                          'Rs 250  ',
                                          style: new TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        new Radio(
                                          value: 1,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                          activeColor: Colors.white,
                                        ),
                                        new Text(
                                          'Medium',
                                          style: new TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                        Spacer(),
                                        new Text(
                                          'Rs 450  ',
                                          style: new TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        new Radio(
                                          value: 2,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                          activeColor: Colors.white,
                                        ),
                                        new Text(
                                          'Large',
                                          style: new TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                        Spacer(),
                                        new Text(
                                          'Rs 650  ',
                                          style: new TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Divider(),
                                GlassmorphicContainer(
                                    width: constraints.maxWidth * 0.95,
                                    height: constraints.maxHeight * 0.08,
                                    borderRadius: 20,
                                    blur: 20,
                                    alignment: Alignment.bottomCenter,
                                    border: 2,
                                    linearGradient: LinearGradient(
                                        colors: [
                                          Colors.white.withOpacity(0.2),
                                          Colors.white38.withOpacity(0.2)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                    borderGradient: LinearGradient(
                                      colors: [
                                        Colors.white24.withOpacity(0.2),
                                        Colors.white70.withOpacity(0.2)
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 13,left: 10,right: 10),
            child: Row(

              children: [
                Text(
                  'total: ' + '$_total',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22),
                ),
                Spacer(),
                InkWell(
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22),
                  ),
                  onTap: () {
                    setState(() {
                      context.read<AuthenticationService>().addCart(widget.id, _total);
                    });
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Cart()));
                  },
                ),
              ],
            )),
            )
                                    ,
                              ],
                            ),
                          )

                          //pizza Image
                        ],
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
          Text(
            'Ready to order?',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22),
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            setState(() {
              context.read<AuthenticationService>().addCart(widget.id, _total);
            });
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));

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

  _removeProduct() {
    setState(() {
      if (_counter > 1) {
        _total = _total - _total;
        _counter--;
      }
    });
  }

  _addProduct() {
    setState(() {
      _total = _total * _counter;
      _counter++;
    });
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
    this.price,
  });

  final String label;
  final String price;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Checkbox(
            value: value,
            onChanged: (newValue) {
              onChanged(newValue);
            },
          ),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Spacer(),
          Text(
            price,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
