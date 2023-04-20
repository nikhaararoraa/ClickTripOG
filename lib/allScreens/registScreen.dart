import 'package:clicktrip/allScreens/landing.dart';
import 'package:clicktrip/allScreens/loginpage.dart';
import 'package:clicktrip/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class registScreen extends StatelessWidget {
  static const String idScreen = "registScreen";

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

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
                  height: 37.0,
                ),
                const Image(
                    image: AssetImage('lib/images/ClickTrip.png'),
                    width: 200.0,
                    height: 200.0,
                    alignment: Alignment.center),
                const SizedBox(
                  height: 25.0,
                ),
                const Text(
                  "Register",
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
                            controller: nameTextEditingController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                labelText: "Name",
                                labelStyle: TextStyle(
                                  fontSize: 14.0,
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0,
                                )),
                            style: const TextStyle(fontSize: 14.0)),
                        TextField(
                            controller: emailTextEditingController,
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
                            style: const TextStyle(fontSize: 14.0)),
                        const SizedBox(
                          height: 1.0,
                        ),
                        TextField(
                          controller: passwordTextEditingController,
                          obscureText: true,
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
                            registerNewUser(context);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF993333),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 50.0,
                              child: const Center(
                                  child: Text("Create an Account",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27.0,
                                      )))),
                        )
                      ],
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => loginScreen()));
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

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailTextEditingController.text,
              password: passwordTextEditingController.text);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LandingPage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
