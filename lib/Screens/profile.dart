import 'package:flutter/material.dart';
import 'package:formapp/Screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfile extends StatefulWidget {
  String passid;
  MyProfile({this.passid});

  @override
  _MyProfileState createState() => _MyProfileState(passid: passid);
}

class _MyProfileState extends State<MyProfile> {
  var myuid = '00';
  String myusersaveid;
  String passid;
  _MyProfileState({this.passid});

  @override
  void initState() {
    super.initState();
    getchecklogin();
  }

  Future getchecklogin() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var mysavedid = sharedPreferences.getString('usersaveid');

    setState(() {
      myusersaveid = mysavedid;
    });
    print(myusersaveid);
  }

  logout() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove('usersaveid');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.blue,
              Colors.lightBlueAccent,
              // Colors.purpleAccent,
            ])),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                "My Profile",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: EdgeInsets.all(20),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My user Id : $passid",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "My user name : $myusersaveid",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: MaterialButton(
                onPressed: () {
                  logout();
                },
                child: Text(
                  "Log Out",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                color: Colors.redAccent,
                minWidth: 200,
                height: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
