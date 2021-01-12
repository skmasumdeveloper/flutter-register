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
  String logedata;

  @override
  void initState() {
    super.initState();

    getchecklogin();
  }

  Future getchecklogin() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var mysavedid = sharedPreferences.getString('usersaveid');
    logedata = mysavedid;

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
