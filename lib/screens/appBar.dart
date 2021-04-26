import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizzaaa/auth/authentication_service.dart';

import 'package:provider/provider.dart';
import 'cart.dart';

class FrosAppbar extends StatefulWidget {
  double height;
  Widget title;
  int leading;
  List<Widget> actions;
  Color color;
  double blurStrengthX;
  double blurStrengthY;

  FrosAppbar({
    this.height,
    this.title,
    this.actions,
    this.blurStrengthX,
    this.blurStrengthY,
    this.color,
    this.leading,
  });

  @override
  _FrosAppbarState createState() => _FrosAppbarState();
}

class _FrosAppbarState extends State<FrosAppbar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: widget.blurStrengthX ?? 10,
                sigmaY: widget.blurStrengthY ?? 10),
            child: Container(
              color: widget.color,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: widget.height ?? 80,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                      widget.leading!=null?Stack(
                        children: [
                          //leading
                          IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Cart())),
                          ),

                          Positioned(
                            top: 25,
                            left: 28,
                              child: Container(
                                height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              color: Colors.red
                            ),
                            child: Center(
                              child: Text(context.read<AuthenticationService>().cartList().length.toString(),
                                  style: GoogleFonts.lato(
                                    textStyle: Theme.of(context).textTheme.headline4,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic,
                                  ),
                              ),
                            )
                            ,
                          )
                          ),

                        ],
                      ):Container(),
                    widget.title ?? Container(),
                    Row(
                      children: widget.actions ?? Container(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
