import 'package:clicktrip/allScreens/startScreen.dart';
import 'package:clicktrip/utils/authcheck.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthCheck(),
      //  home: StartScreen(),

      //  initialRoute: loginScreen.idScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}
