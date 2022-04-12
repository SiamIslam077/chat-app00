import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_first_app/chat_app/views/login_page.dart';
import 'package:flutter_first_app/chat_app/controller/auth_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  AuthController authController = AuthController();

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
                    shape: const StadiumBorder()
                ),
                onPressed: () async{
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  preferences.setString('email', emailController.text);
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    authController.register(
                        context, emailController.text, passwordController.text);
                  }else{
                    authController.showError(context, 'Fields not must be empty');
                  }

                },
                child: const Text('SignUp',textScaleFactor: 1.2,),),

                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Have an account ?'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        child: const Text('Login',
                        textScaleFactor: 1.3,
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
