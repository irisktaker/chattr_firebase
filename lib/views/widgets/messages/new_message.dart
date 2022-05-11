import 'package:chattr/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewMessageWidget extends StatefulWidget {
  const NewMessageWidget({Key? key}) : super(key: key);

  @override
  State<NewMessageWidget> createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  final _controller = TextEditingController();
  String _enteredMessage = '';

  _sendMessage() async {
    // final user = FirebaseAuth.instance.currentUser;
    // final userData = await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(user!.uid)
    //     .get();

    // Send a message here
    FirebaseFirestore.instance.collection('chat_messages').add({
      'message_text': _enteredMessage,
      'sent_at': Timestamp.now(),
    });

    // Clear the message in the text field after sending it
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: kPrimaryColor,
            foregroundColor: kIconsBorder,
            radius: 25,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.emoji_emotions_outlined,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 55,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kSecondaryColor.withOpacity(0.2),
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.attach_file),
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (val) {
                  setState(() {
                    _enteredMessage = val;
                  });
                },
              ),
            ),
          ),
          const SizedBox(width: 16),
          CircleAvatar(
            backgroundColor: kPrimaryColor,
            foregroundColor: kIconsBorder,
            radius: 25,
            child: IconButton(
              onPressed: () {
                _enteredMessage.trim().isEmpty ? null : _sendMessage();
              },
              icon: const Icon(
                Icons.send_outlined,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
