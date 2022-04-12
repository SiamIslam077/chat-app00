import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/chat_app/custom_colors/colors.dart';
import 'package:flutter_first_app/chat_app/views/chat_screen_page.dart';
import 'package:flutter_first_app/chat_app/views/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');

  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Palette.cRed,
      fontFamily: 'Georgia'
    ),
    debugShowCheckedModeBanner: false,
    home: email == null ? const ChatScreenPage() : const LoginPage(),
  ));
}
