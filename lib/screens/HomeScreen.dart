import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:pizzaaa/auth/authentication_service.dart';
import 'package:pizzaaa/screens/LoginScreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            // appBar: PreferredSize(
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(15),
            //     child: BackdropFilter(
            //       filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            //       child: AppBar(
            //         leading: Container(),
            //         backgroundColor: Colors.white.withOpacity(0.2),
            //         title: Text('Pizza Delivery',
            //         style: TextStyle(
            //           color: Colors.black
            //         ),),
            //         actions: [
            //           IconButton(
            //             icon: Icon(Icons.logout),
            //             onPressed: () {
            //               context.read<AuthenticationService>().signOut();
            //             },
            //           )
            //         ],
            //         elevation: 0.0,
            //       ),
            //     ),
            //   ),
            //   preferredSize: Size(
            //     double.infinity,
            //     56.0,
            //   ),
            // ),
            body: SafeArea(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Colors.blueGrey,
                      Colors.black87,
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Column(
                    children: [
                      Divider(),
                      GlassmorphicContainer(
                          width: constraints.maxWidth * 0.95,
                          height: constraints.maxHeight * 0.08,
                          borderRadius: 20,
                          blur: 20,
                          alignment: Alignment.bottomCenter,
                          border: 2,
                          linearGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFffffff).withOpacity(0.3),
                                Color(0xFFFFFFFF).withOpacity(0.1),
                              ],
                              stops: [
                                0.1,
                                1,
                              ]),
                          borderGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFffffff).withOpacity(0.5),
                              Color((0xFFFFFFFF)).withOpacity(0.5),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.menu_sharp,
                                size: 45,
                              ),
                              Text('Pizza Order App',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Padding(padding: EdgeInsets.only(right: 5),child: Icon(Icons.account_circle,size: 45,),)
                            ],
                          )),
                      Divider(),
                      Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: constraints.maxHeight * 0.82,
                                width: constraints.maxWidth * 0.1,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(
                                    25.0,
                                  ),
                                ),
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: PreferredSize(
                                      child: ClipRRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 5, sigmaY: 5),
                                          child: TabBar(
                                            controller: _tabController,
                                            unselectedLabelColor: Colors.white,
                                            labelColor: Colors.black87,
                                            indicator: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                25.0,
                                              ),
                                              color: Colors.orangeAccent,
                                            ),
                                            tabs: [
                                              Tab(text: "ONGOING"),
                                              Tab(text: "ONGOING"),
                                              Tab(text: "ONGOING"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      preferredSize: Size(
                                        double.infinity,
                                        56.0,
                                      ),
                                    ),

                                ),
                              ),
                              Spacer(),
                              GlassmorphicContainer(
                                width: constraints.maxWidth * 0.80,
                                height: constraints.maxHeight * 0.82,
                                borderRadius: 20,
                                blur: 20,
                                border: 2,
                                linearGradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFFffffff).withOpacity(0.3),
                                      Color(0xFFFFFFFF).withOpacity(0.1),
                                    ],
                                    stops: [
                                      0.1,
                                      1,
                                    ]),
                                borderGradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFffffff).withOpacity(0.5),
                                    Color((0xFFFFFFFF)).withOpacity(0.5),
                                  ],
                                ),
                              ),
                              Spacer(),

                            ],
                          ),

                        ],
                      )
                    ],
                  );
                }),
              ),
            )));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
