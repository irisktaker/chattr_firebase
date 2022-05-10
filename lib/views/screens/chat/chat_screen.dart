// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:chattr/utils/constants.dart';
import 'package:chattr/utils/size_config.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:chattr/views/screens/chat/components/chat_app_bar.dart';
import 'package:chattr/views/screens/chat/components/pending_list.dart';
import 'package:chattr/views/screens/chat/components/chatter_list.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static const routeScreen = 'chat_screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var _currentIndex = 0;

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
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 26.0),
        child: Opacity(
          opacity: 0.8,
          child: Container(
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 33),
            padding: const EdgeInsets.symmetric(horizontal: 33),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: SalomonBottomBar(
              currentIndex: _currentIndex,
              onTap: (i) => setState(() => _currentIndex = i),
              unselectedItemColor: kSecondaryColor,
              selectedItemColor: kPrimaryColor,
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(Icons.maps_ugc_outlined),
                  title: const Text("chats"),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.pin_drop),
                  title: const Text("nearby"),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.access_time),
                  title: const Text("recent"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
