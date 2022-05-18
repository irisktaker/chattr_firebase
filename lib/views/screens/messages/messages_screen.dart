import 'package:flutter/material.dart';

import 'package:chattr/shared/theme.dart';
import 'package:chattr/shared/constants.dart';
import 'package:chattr/views/screens/messages/components/messages.dart';
import 'package:chattr/views/screens/messages/components/new_message.dart';

class ChatMessagesScreen extends StatelessWidget {
  const ChatMessagesScreen({Key? key}) : super(key: key);
  static const routeScreen = 'chat_messages_screen';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => FocusScope.of(context).unfocus()),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: 
            Column(
              children: [
                _appBar(),
                const Expanded(child: MessageWidget()),
                const NewMessageWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _appBar() {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 26),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white.withOpacity(0.4),
            backgroundImage: const NetworkImage(
              "https://images.unsplash.com/photo-1594751439417-df8aab2a0c11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
            ),
            child: Stack(
              children: const [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 9,
                    backgroundColor: kBgColor,
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor: kAwayColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            children: [
              Text(
                "Will Wade",
                style: titleStyle,
              ),
              Text(
                "Away 10m",
                style: subtitleStyle,
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: kSecondaryColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
