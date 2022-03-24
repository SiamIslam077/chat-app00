import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/chat_app01/views01/chat_screen01.dart';
import 'package:flutter_first_app/chat_app01/views01/login_page01.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyAuthController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void signInWithGoogle(context) async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential userCredential =
        await firebaseAuth.signInWithCredential(credential);
    User? user = userCredential.user;

    if (user != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MyChatScreen()));
    }
  }

  void resister(context, email, password) async {
    try {
      firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              MaterialPageRoute(builder: (context) => const MyLoginPage()));
    } catch (er) {
      showError(context, er);
    }
  }

  void login(context, email, password) async {
    try {
      firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              MaterialPageRoute(builder: (context) => const MyChatScreen()));
    } catch (er) {
      showError(context, er);
    }
  }

  void signOut(context) async {
    try {
      firebaseAuth.signOut().then((value) =>
          MaterialPageRoute(builder: (context) => const MyLoginPage()));
    } catch (er) {
      showError(context, er);
    }
  }

  void showError(context, er) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: const Text('error'), content: Text(er.toString())));
  }
}
