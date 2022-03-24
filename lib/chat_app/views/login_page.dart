// import 'package:flutter/material.dart';
// import 'package:flutter_first_app/chat_app/views/signup_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_first_app/chat_app/controller/auth_controller.dart';
//
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   AuthController authController = AuthController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.teal,
//       appBar: AppBar(
//         title: Text('LoginPage'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Card(
//           elevation: 0.0,
//           margin: EdgeInsets.symmetric(horizontal: 12.0),
//           color: Colors.white,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 12.0),
//                 child: TextFormField(
//                   controller: emailController,
//                   obscureText: false,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     hintText: 'Enter UserName',
//                     contentPadding: EdgeInsets.only(left: 10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 12.0),
//                 child: TextFormField(
//                   controller: passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     hintText: 'Enter Password',
//                     contentPadding: EdgeInsets.only(left: 10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton(
//                 style: TextButton.styleFrom(
//                     minimumSize: Size(200, 50), shape: StadiumBorder()),
//                 onPressed: () async{
//                   SharedPreferences prefernces = await SharedPreferences.getInstance();
//                   prefernces.setString('email', emailController.text);
//                   if (emailController.text.isNotEmpty &&
//                       passwordController.text.isNotEmpty) {
//                     authController.loginUser(
//                         context, emailController.text, passwordController.text);
//                   }else{
//                     authController.showError(context, 'Fields not must be empty');
//                   }
//                 },
//                 child: Text(
//                   'Login',
//                   textScaleFactor: 1.2,
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton(
//                 style: TextButton.styleFrom(
//                     minimumSize: Size(200, 50), shape: StadiumBorder()),
//                 onPressed: () {
//                   authController.signInWithGoogle(context);
//                 },
//                 child: Text(
//                   'Login with google',
//                   textScaleFactor: 1.2,
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text('Create a account ? '),
//                   TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => SignUpPage()));
//                       },
//                       child: Text('SignUp'))
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
