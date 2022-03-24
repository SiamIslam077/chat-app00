// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_first_app/chat_app/views/chat_screen_page.dart';
// import 'package:flutter_first_app/chat_app/views/login_page.dart';
//
//
// class AuthController {
//   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//
//   void signInWithGoogle(context) async {
//     GoogleSignIn googleSignIn = GoogleSignIn();
//     GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//     GoogleSignInAuthentication googleSignInAuthentication =
//     await googleSignInAccount!.authentication;
//     AuthCredential credential = GoogleAuthProvider.credential(
//         idToken: googleSignInAuthentication.idToken,
//         accessToken: googleSignInAuthentication.accessToken);
//
//     UserCredential userCredential =
//     await firebaseAuth.signInWithCredential(credential);
//
//     User? user = userCredential.user;
//
//     if (user != null) {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => const ChatScreenPage()));
//     }
//   }
//
//   void register(context, email, password) async {
//     try {
//       firebaseAuth
//           .createUserWithEmailAndPassword(email: email, password: password)
//           .then((value) => Navigator.push(
//           context, MaterialPageRoute(builder: (context) => const LoginPage())));
//     } catch (e) {
//       showError(context, e);
//     }
//   }
//
//   void loginUser(context, email, password) async {
//     try {
//       firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => const ChatScreenPage()));
//     } catch (e) {
//       showError(context, e);
//     }
//   }
//
//   void signOut(context) async {
//     try {
//       firebaseAuth.signOut().then(
//               (value) => MaterialPageRoute(builder: (context) => const LoginPage()));
//     } catch (e) {
//       showError(context, e);
//     }
//   }
//
//   void showError(context, e) {
//     showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text('Error message'),
//           content: Text(e.toString()),
//         ));
//   }
// }
