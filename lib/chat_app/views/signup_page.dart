// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_first_app/chat_app/views/login_page.dart';
// import 'package:flutter_first_app/chat_app/controller/auth_controller.dart';
//
// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   AuthController authController = AuthController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.teal,
//       appBar: AppBar(
//         title: const Text('LoginPage'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Card(
//           color: Colors.white,
//           elevation: 0.0,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                 child: TextFormField(
//                   controller: emailController,
//                   obscureText: false,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: const InputDecoration(
//                     hintText: 'Enter UserName',
//                     contentPadding: EdgeInsets.only(left: 10.0),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                 child: TextFormField(
//                   controller: passwordController,
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     hintText: 'Enter Password',
//                     contentPadding: EdgeInsets.only(left: 10.0),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10,),
//
//               ElevatedButton(
//                 style: TextButton.styleFrom(
//                     minimumSize: const Size(200, 50),
//                     shape: const StadiumBorder()
//                 ),
//                 onPressed: () async{
//                   SharedPreferences prefernces = await SharedPreferences.getInstance();
//                   prefernces.setString('email', emailController.text);
//                   if (emailController.text.isNotEmpty &&
//                       passwordController.text.isNotEmpty) {
//                     authController.register(
//                         context, emailController.text, passwordController.text);
//                   }else{
//                     authController.showError(context, 'Fields not must be empty');
//                   }
//
//                 },
//                 child: const Text('SignUp',textScaleFactor: 1.2,),
//               ),
//               const SizedBox(height: 10,),
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text('Have an account ?'),
//                   TextButton(onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => const LoginPage()));
//                   }, child: const Text('Login'))
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }