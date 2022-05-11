import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:chattr/views/screens/messages/components/message_bubble.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat_messages')
          .orderBy(
            'sent_at',
            descending: true,
          )
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data!.docs;
        // final user = FirebaseAuth.instance.currentUser;

        return ListView.builder(
          reverse: true,
          itemCount: docs.length,
          itemBuilder: (context, index) {
            return MessageBubbleWidget(
              docs[index]['message_text'],
              // docs[index]['username'],
              // docs[index]['userImage'],
              // key: ValueKey(docs[index]['userId']),
            );
          },
        );
      },
    );
  }
}