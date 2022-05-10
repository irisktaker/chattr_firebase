// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:chattr/utils/constants.dart';
import 'package:chattr/utils/size_config.dart';
import 'package:chattr/views/screens/chat/chat_app_bar.dart';
import 'package:chattr/views/screens/chat/pending_list.dart';
import 'package:chattr/views/screens/chat/chatter_list.dart';

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
        bottomNavigationBar: _bottomNavigationBar(),
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

  _bottomNavigationBar() {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 33),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 150.0),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.wallet_giftcard),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.holiday_village),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
