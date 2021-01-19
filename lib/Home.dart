import 'dart:async';

import 'package:flutter/material.dart';
import 'package:formapp/Screens/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/login.dart';
import 'Screens/register.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var logedata;

  Future<SharedPreferences> dataprefs = SharedPreferences.getInstance();

  void incrementCounter() async {
    SharedPreferences prefs = await dataprefs;

    setState(() {
      prefs.setString('usersaveid', '38');
    });
    print(logedata);
  }

  @override
  void initState() {
    super.initState();
    // incrementCounter();
    dhoom();
  }

  void dhoom() async {
    final SharedPreferences prefs = await dataprefs;
    setState(() {
      logedata = prefs.getString('usersaveid');
      print(logedata);
    });
    getchecklogin();
  }

  Future getchecklogin() async {
    if (logedata == null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MyProfile(passid: logedata)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: LoginPage(),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
