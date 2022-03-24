import 'package:flutter/material.dart';

class MyChatScreen extends StatefulWidget {
  const MyChatScreen({Key? key}) : super(key: key);

  @override
  State<MyChatScreen> createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
    );
  }
}
