import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Register Form App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.blue,
        // primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: MyHomePage(title: 'Flutter Register Form App pro'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool _showPassword = false;
  var formmsgsuccess = '';
  var formmsgerror = '';
  var resmsg;

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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [
              Colors.deepPurple[700],
              Colors.purple[500],
            ],
            begin: const FractionalOffset(0.5, 0.0),
            end: const FractionalOffset(0.0, 0.5),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: Drawer(),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Username",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 17.0),
                    ),
                    TextField(
                      controller: name,
                      //autofocus: true,
                      style: TextStyle(color: Colors.white, fontSize: 23),
                      decoration: InputDecoration(
                        hintText: 'Enter Your Name',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: password,
                      obscureText: !_showPassword,
                      //autofocus: true,
                      style: TextStyle(color: Colors.white, fontSize: 23),
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: 'Enter Your Password',
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.grey),
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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(width: 2, color: Colors.green)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(width: 2, color: Colors.green)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: formmsgerror == "fail"
                          ? Text(
                              formmsgsuccess,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                              ),
                            )
                          : Text(
                              formmsgsuccess,
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                              ),
                            ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("Register"),
                        onPressed: () {
                          senddata();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 200,
                      child: RaisedButton(
                        color: Colors.black,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("Clear"),
                        onPressed: () {
                          setState(() {
                            name.clear();
                            password.clear();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
