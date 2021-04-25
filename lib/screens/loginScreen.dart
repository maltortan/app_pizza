
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:pizzaaa/screens/appBar.dart';
import 'package:provider/provider.dart';

import '../auth/authentication_service.dart';

bool isLoading = true;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var scrSize = MediaQuery.of(context).size;
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
                top: scrSize.height*0.12,
                left: scrSize.width*0.02,
                child: GlassmorphicContainer(
                  width: scrSize.width*0.96 ,
                  height: scrSize.height*0.4,
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
            ),
            Column(
                children: [
              Divider(height: 80,),
              Padding(
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 20
                            )
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter username";
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
                              return "Please enter username";
                            }
                            return null;
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            child: Text("Forgot Password?",style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                            ),),
                            onPressed: () => {},
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(0),
                            child: isLoading
                                ? ElevatedButton(
                              child: Text(
                                  'Log in',
                                style: TextStyle(
                                  fontSize: 18,

                                ),
                              ),
                              onPressed: () async {
                                setState(() {
                                  isLoading = false;
                                });
                                if (_formKey.currentState.validate()) {
                                  dynamic results = await context
                                      .read<AuthenticationService>()
                                      .signIn(
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
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                }
                                setState(() {
                                  isLoading = true;
                                });
                              },
                            )
                                : Center(child: CircularProgressIndicator())
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Text("Not a member yet?",style: TextStyle(fontSize: 16),),
                        TextButton(
                          child: Text("Register now",style: TextStyle(fontSize: 16,color: Colors.white),),
                          onPressed: () => {
                            {Navigator.pushNamed(context, '/signup')},
                          },
                        ),
                      ],
                    ),
                  ))
            ]),
            FrosAppbar(
              title: Text('Login',
              style: TextStyle(
                fontSize: 25
              ),),
              actions: [],

            )
          ],
        )

      ),
    );
  }
}
