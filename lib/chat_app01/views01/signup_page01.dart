import 'package:flutter/material.dart';
import 'package:flutter_first_app/chat_app01/controller01/auth_controller01.dart';
import 'package:flutter_first_app/chat_app01/views01/login_page01.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySignupPage extends StatefulWidget {
  const MySignupPage({Key? key}) : super(key: key);

  @override
  State<MySignupPage> createState() => _MySignupPageState();
}

class _MySignupPageState extends State<MySignupPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  MyAuthController myAuthController = MyAuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.amberAccent,
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sing Up',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: 'enter first name',
                        contentPadding: EdgeInsets.only(left: 10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: 'enter last name',
                        contentPadding: EdgeInsets.only(left: 10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'enter emailAddress',
                        contentPadding: EdgeInsets.only(left: 10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'enter Password',
                        contentPadding: EdgeInsets.only(left: 10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () async {
                      SharedPreferences preference =await SharedPreferences.getInstance();
                      preference.setString('email', emailController.text);
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        myAuthController.resister(context, emailController.text,
                            passwordController.text);
                      } else {
                        myAuthController.showError(
                            context, 'Must not be empty');
                      }
                    },
                    child: const Text(
                      'Sing-up',
                      style: TextStyle(fontSize: 30.0),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Already have an Account?',
                      textScaleFactor: 1.2,
                    ),
                    const SizedBox(
                      width: 0.5,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyLoginPage()));
                        },
                        child: const Text(
                          'sing-in',
                          textScaleFactor: 1.7,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
