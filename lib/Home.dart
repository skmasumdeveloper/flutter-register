import 'package:flutter/material.dart';

import 'Screens/login.dart';
import 'Screens/register.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: LoginPage(),
      body: RegisterPage(),
    );
  }
}
