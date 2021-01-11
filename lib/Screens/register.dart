import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formapp/Screens/login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool _showPassword = false;
  var formmsgsuccess = '';
  var formmsgerror = "0";
  var resmsg;
  var formmsgbox;

  Future<void> senddata() async {
    final response = await http
        .post("http://192.168.31.103/flutterform/register.php", body: {
      'username': name.text,
      'password': password.text,
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    resmsg = json.decode(response.body);

    setState(() {
      name.clear();
      password.clear();
      formmsgsuccess = resmsg['msg2'];
      formmsgerror = resmsg['msg1'];
    });

    msgtime();
  }

  msgtime() async {
    Timer(Duration(seconds: 6), () {
      setState(() {
        formmsgerror = "0";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.red,
            Colors.black,
            Colors.black,
          ],
        ),
        // image: DecorationImage(
        //   image: AssetImage('Assets/image2.png'),
        //   fit: BoxFit.cover,
        // ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.all(23),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    "https://1stwebdesigner.com/wp-content/uploads/2017/11/ios-11-icons-04.jpg",
                  ),
                  // child: ClipOval(
                  //   child: Image.network(
                  //       "https://1stwebdesigner.com/wp-content/uploads/2017/11/ios-11-icons-04.jpg",
                  //       // width: 120,
                  //       fit: BoxFit.fill),
                  // ),
                ),
                SizedBox(
                  height: 50,
                ),
                formmsgerror == "0"
                    ? Container()
                    : Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 25,
                        child: formmsgerror == "fail"
                            ? Text(
                                formmsgsuccess,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                ),
                              )
                            : Text(
                                formmsgsuccess,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 18,
                                ),
                              ),
                      ),
                Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: TextFormField(
                          controller: name,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: 'Username',
                              labelStyle:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                        ),
                      ),
                      TextFormField(
                        controller: password,
                        obscureText: !_showPassword,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Icon(
                                _showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: 'Password',
                            labelStyle:
                                TextStyle(fontSize: 15, color: Colors.white)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Forgot your password?',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontFamily: 'SFUIDisplay',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: () {
                      senddata();
                    },
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'SFUIDisplay',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    color: Colors.redAccent,
                    elevation: 0,
                    minWidth: 300,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Center(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(
                              fontFamily: 'SFUIDisplay',
                              color: Colors.white,
                              fontSize: 18,
                            )),
                        TextSpan(
                            text: " Login",
                            style: TextStyle(
                              fontFamily: 'SFUIDisplay',
                              color: Color(0xffff2d55),
                              fontSize: 20,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("login clicked");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              })
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
