// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ChatMessagesScreen extends StatelessWidget {
  static const routeScreen = 'chat_message_screen';

  ChatMessagesScreen({
    Key? key,
    required this.userIndex,
  }) : super(key: key);
  int userIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(child: Text("Chat Messages $userIndex")),
      ),
    );
  }
}


