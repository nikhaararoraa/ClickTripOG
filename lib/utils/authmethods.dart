import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<User?> createAccount(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      //await user.updateDisplayName(name);

      await _firestore.collection("users").doc(_auth.currentUser!.uid).set({
        //"name": name,
        "email": email,
        "uid": _auth.currentUser!.uid,
      });
      return user;
    } else {
      return user;
    }
  } catch (e) {
    return null;
  }
}

Future<User?> loginUser(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      return user;
    } else {
      return user;
    }
  } catch (e) {
    return null;
  }
}

Future signingOut() async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut();
  } catch (e) {
    return null;
  }
}
