
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';

import '../auth/authentication_service.dart';

bool isLoading1= true;

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var scrSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(

        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg2.jpg'),
                fit: BoxFit.cover,
              ),),
            child: Stack(
                children: [
                  // for creating the purple ball


                  Positioned(
                    top: scrSize.height * 0.12,
                    left: scrSize.width * 0.02,
                    child: GlassmorphicContainer(
                      width: scrSize.width * 0.96,
                      height: scrSize.height * 0.4,
                      borderRadius: scrSize.height * 0.02,
                      blur: 15,
                      alignment: Alignment.center,
                      border: 2,
                      linearGradient: LinearGradient(
                          colors: [
                            Colors.blueGrey.withOpacity(0.2),
                            Colors.red.withOpacity(0.2)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderGradient: LinearGradient(colors: [
                        Colors.white24.withOpacity(0.2),
                        Colors.white70.withOpacity(0.2)
                      ]),
                    ),
                  ), Column(children: [
                    Divider(height: 80,),
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  hintText: "Name",
                                    hintStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20
                                    )
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please enter your name";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                    hintStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20
                                    )
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please enter your Email";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20
                                    )
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please enter password";
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                  padding: EdgeInsets.all(0),
                                  child: isLoading1
                                      ? ElevatedButton(
                                      child: Text("Register",style: TextStyle(
                                        fontSize: 18,

                                      ),),
                                      onPressed: () async
                                      {
                                        setState(() {
                                          isLoading1 = false;
                                        });

                                        if (_formKey.currentState.validate()) {
                                          dynamic results = await context.read<
                                              AuthenticationService>().signUp(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );

                                          if (results != null) {
                                            showDialog<void>(
                                              context: context,
                                              barrierDismissible: false,
                                              // user must tap button!
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Error'),
                                                  content: SingleChildScrollView(
                                                    child: ListBody(
                                                      children: <Widget>[
                                                        Text(results),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: Text('Done'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        }
                                        setState(() {
                                          isLoading1 = true;
                                        });
                                      }
                                  ) : Center(child: CircularProgressIndicator())
                              ),
                              Padding(padding: EdgeInsets.all(8)),
                              Text("Already a user?",style: TextStyle(fontSize: 16),),
                              TextButton(
                                child: Text("Go to login",style: TextStyle(fontSize: 16,color: Colors.white),),
                                onPressed: () => {Navigator.pop(context)},
                              ),
                            ],
                          ),
                        ))
                  ])
                ]
            )
        )
    );
  }
}
