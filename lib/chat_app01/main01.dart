import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/chat_app01/views01/chat_screen01.dart';
import 'package:flutter_first_app/chat_app01/views01/login_page01.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');

  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
  home: email == null ? const MyChatScreen(): const MyLoginPage(),
  ));
}