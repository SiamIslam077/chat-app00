import 'package:flutter/material.dart';
import 'package:flutter_first_app/chat_app/views/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_first_app/chat_app/controller/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  AuthController authController = AuthController();

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
                const SizedBox(
                  height: 13.0,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Forgot your password ?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                      minimumSize: const Size(200, 50), shape: const StadiumBorder()),
                  onPressed: () async {
                    SharedPreferences prefernces =
                        await SharedPreferences.getInstance();
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      authController.loginUser(context, emailController.text,
                          passwordController.text);
                    } else {
                      authController.showError(
                          context, 'Fields not must be empty');
                    }
                    prefernces.setString('email', emailController.text);
                  },
                  child: const Text(
                    'Login',
                    textScaleFactor: 1.2,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                      minimumSize: const Size(200, 50), shape: const StadiumBorder()),
                  onPressed: () {
                    authController.signInWithGoogle(context);
                  },
                  child: const Text(
                    'Login with google',
                    textScaleFactor: 1.2,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Create a account ? '),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                        child: const Text(
                          'SignUp',
                          textScaleFactor: 1.3,
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
