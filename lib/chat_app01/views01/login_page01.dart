import 'package:flutter/material.dart';
import 'package:flutter_first_app/chat_app01/controller01/auth_controller01.dart';
import 'package:flutter_first_app/chat_app01/views01/signup_page01.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  MyAuthController myAuthController = MyAuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.green,
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Log In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                    elevation: 0.0,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: const InputDecoration(
                          hintText: 'Enter User Name/E-mail',
                          contentPadding: EdgeInsets.only(left: 10.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: 'Enter password',
                          contentPadding: EdgeInsets.only(left: 10.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 13.0,),
                Container(
                  margin: const EdgeInsets.fromLTRB(10,0,10,20),
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: const Text( "Forgot your password ?",
                      style: TextStyle( color: Colors.white, ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () async {
                      SharedPreferences preference = await SharedPreferences.getInstance();
                      preference.setString('email', emailController.text);
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        myAuthController.login(context, emailController.text,
                            passwordController.text);
                      } else {
                        myAuthController.showError(
                            context, 'This must Not be empty');
                      }
                    },
                    child: const Text(
                      'Sing-In',
                      textScaleFactor: 1.4,
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () async {
                      myAuthController.signInWithGoogle(context);
                    },
                    child: const Text(
                      'Login with GOOGLE',
                      textScaleFactor: 1.4,
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Create an Account',
                      textScaleFactor: 1.3,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MySignupPage()));
                        },
                        child: const Text(
                          'Sing-up',
                          textScaleFactor: 1.7,
                          style: TextStyle(
                              color: Colors.white, fontStyle: FontStyle.italic),
                        )),
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
