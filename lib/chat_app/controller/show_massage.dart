import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/chat_app/views/chat_screen_page.dart';

class ShowMassagePage extends StatefulWidget {
  const ShowMassagePage({Key? key}) : super(key: key);

  @override
  State<ShowMassagePage> createState() => _ShowMassagePageState();
}

class _ShowMassagePageState extends State<ShowMassagePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('User1')
            .orderBy('time')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              shrinkWrap: true,
              primary: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[index];
                return ListTile(
                  title: Column(
                    crossAxisAlignment:
                        loginUser!.email == documentSnapshot['user']
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: loginUser!.email == documentSnapshot['user']
                              ? Colors.blue
                              : Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          documentSnapshot['message'],
                          textScaleFactor: 1.2,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        documentSnapshot['user'],
                        // textScaleFactor: 1.3,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
