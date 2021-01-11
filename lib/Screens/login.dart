import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:formapp/Screens/register.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: 370,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      // image: AssetImage('Assets/image1.png'),
                      image: AssetImage('Assets/imagelogin.gif'),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Form(
                child: Padding(
                  padding: EdgeInsets.all(23),
                  child: ListView(
                    children: <Widget>[
                      Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          // fontFamily: 'SFUIDisplay',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Container(
                          color: Color(0xfff5f5f5),
                          child: TextFormField(
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'SFUIDisplay'),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.transparent.withOpacity(0)),
                                ),
                                border: OutlineInputBorder(),
                                labelText: 'Username',
                                prefixIcon: Icon(Icons.person_outline),
                                labelStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ),
                      Container(
                        color: Color(0xfff5f5f5),
                        child: TextFormField(
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'SFUIDisplay'),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                borderSide: BorderSide(
                                    color: Colors.transparent.withOpacity(0)),
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock_outline),
                              labelStyle: TextStyle(fontSize: 15)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: MaterialButton(
                          onPressed: () {}, //since this is only a UI app
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'SFUIDisplay',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Color(0xffff2d55),
                          elevation: 0,
                          minWidth: 400,
                          height: 50,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Center(
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                                fontFamily: 'SFUIDisplay',
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Center(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Don't have an account?",
                                  style: TextStyle(
                                    fontFamily: 'SFUIDisplay',
                                    color: Colors.black,
                                    fontSize: 15,
                                  )),
                              TextSpan(
                                  text: " Sign Up",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterPage()));
                                    },
                                  style: TextStyle(
                                    fontFamily: 'SFUIDisplay',
                                    color: Color(0xffff2d55),
                                    fontSize: 18,
                                  ))
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
