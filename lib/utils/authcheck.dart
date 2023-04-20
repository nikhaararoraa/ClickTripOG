import 'package:clicktrip/allScreens/landing.dart';
import 'package:clicktrip/allScreens/loginpage.dart';
import 'package:clicktrip/allScreens/registScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../allScreens/mainScreen.dart';

class AuthCheck extends StatelessWidget {
  AuthCheck({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser == null) {
      return loginScreen();
    } else {
      return LandingPage();
    }
  }
}
