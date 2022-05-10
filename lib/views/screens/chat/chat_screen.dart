// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:chattr/utils/constants.dart';
import 'package:chattr/utils/size_config.dart';
import 'package:chattr/views/screens/chat/components/chat_app_bar.dart';
import 'package:chattr/views/screens/chat/components/pending_list.dart';
import 'package:chattr/views/screens/chat/components/chatter_list.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static const routeScreen = 'chat_screen';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ChatAppBar(),
                PendingUserList(),
                ChatterUserList(),
              ],
            ),
          ),
        ),
        floatingActionButton: _floatingActionButton(),
      ),
    );
  }

  _floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: kPrimaryColor,
      onPressed: () {},
      child: const Icon(Icons.chat_bubble_outline),
    );
  }
}
