import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  double height;
  Widget title;
  Widget leading;
  List<Widget> actions;
  Color color;
  double blurStrengthX;
  double blurStrengthY;

  CustomTabBar(
      {
        this.height,
        this.title,
        this.actions,
        this.blurStrengthX,
        this.blurStrengthY,
        this.color,
        this.leading,
      }
      );
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: widget.blurStrengthX ?? 10,
                sigmaY: widget.blurStrengthY ?? 10
            ),
            child: Container(
              color: widget.color,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: widget.height??80,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 56,
                    color: Colors.transparent,
                    child: widget.leading,
                  ),

                  Padding(padding: EdgeInsets.only(top: 5),
                    child: Expanded(child: widget.title??Container()),),
                  Row(
                    children:
                    widget.actions??Container(),
                  )
                ],

              ),
            ),
          ),
        )
    );
  }
}
