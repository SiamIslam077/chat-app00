import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_first_app/chat_app/controller/show_massage.dart';
import 'package:flutter_first_app/chat_app/custom_colors/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

var loginUser = FirebaseAuth.instance.currentUser;

class ChatScreenPage extends StatefulWidget {
  const ChatScreenPage({Key? key}) : super(key: key);

  @override
  State<ChatScreenPage> createState() => _ChatScreenPageState();
}

class _ChatScreenPageState extends State<ChatScreenPage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var message = TextEditingController();
  var storeMessage = FirebaseFirestore.instance;

  getCurrentUser() {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      loginUser = user;
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Massages'),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.search)),],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                accountName: Text('Siam'),
                accountEmail: Text('Siam@gmail.com')),
            const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            const ListTile(
              leading: Icon(Icons.notifications_active),
              title: Text('Notification'),
            ),
            const ListTile(
              leading: Icon(Icons.switch_account_rounded),
              title: Text('Switch account'),
            ),
            const ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
            ),
            ListTile(
              leading: const Icon(Icons.login_outlined),
              title: const Text('Log out'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) =>
                        AlertDialog(
                          title: const Text('Logout'),
                          content:
                          const Text('Are you sure you want to Logout ?'),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () async {
                                  SharedPreferences preference =
                                  await SharedPreferences.getInstance();
                                  Navigator.pop(context);
                                  preference.clear();
                                },
                                child: const Text('yes')),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No'))
                          ],
                        ));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // const SizedBox(height: 220,),
            const ShowMassagePage(),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, right: 10.0, bottom: 10.0, left: 10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      controller: message,
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: 'write massage',
                          hintStyle:
                          const TextStyle(fontSize: 14.0, color: Colors.green),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          ),
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.emoji_emotions),
                            color: Palette.cGreen[400],
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.link,
                                  color: Colors.redAccent,
                                )),
                          )),
                      maxLines: 5,
                      minLines: 1,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (message != null) {
                        storeMessage.collection('User1').doc().set({
                          'message': message.text.trim(),
                          'user': loginUser!.email.toString(),
                          'time': DateTime.now(),
                        });
                      }
                      message.clear();
                    },
                    icon: const Icon(Icons.send,
                      color: Palette.cGreen,)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
