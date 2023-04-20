import 'package:clicktrip/allScreens/landing.dart';
import 'package:clicktrip/allScreens/registScreen.dart';
import 'package:clicktrip/utils/authmethods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatelessWidget {
  static const String idScreen = "loginScreen";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 47.0,
                ),
                const Image(
                    image: AssetImage('lib/images/ClickTrip.png'),
                    width: 270.0,
                    height: 270.0,
                    alignment: Alignment.center),
                const SizedBox(
                  height: 29.0,
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 1.0,
                        ),
                        TextField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  fontSize: 14.0,
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0,
                                )),
                            style: TextStyle(fontSize: 14.0)),
                        const SizedBox(
                          height: 1.0,
                        ),
                        TextField(
                          obscureText: true,
                          controller: pass,
                          decoration: const InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                fontSize: 14.0,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0,
                              )),
                          style: const TextStyle(fontSize: 14.0),
                        ),
                        const SizedBox(
                          height: 27.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            loginUser(email.text, pass.text).then((value) {
                              if (_auth.currentUser != null) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LandingPage()));
                              }
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF993333),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 50.0,
                              child: const Center(
                                  child: Text("login",
                                      style: TextStyle(
                                          fontSize: 27.0,
                                          color: Colors.white)))),
                        ),
                      ],
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => registScreen()));
                    },
                    child: const Text(
                      "Do not have an account register here",
                      style: TextStyle(color: Color(0xFF993333)),
                    ))
              ],
            ),
          ),
        ));
  }
}
