// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:chattr/utils/theme.dart';
import 'package:chattr/utils/constants.dart';
import 'package:chattr/utils/size_config.dart';
import 'package:chattr/views/screens/chat/chat_bloc.dart';
import 'package:chattr/views/screens/chat/pending_list.dart';
import 'package:chattr/views/screens/chat/chatter_list.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  static const routeScreen = 'chat_screen';
  final _bloc = ChatBloc();

  _chatBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 33, bottom: 33),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white.withOpacity(0.4),
            backgroundImage: const NetworkImage(
              "https://images.unsplash.com/photo-1594751439417-df8aab2a0c11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
            ),
          ),
          const Spacer(),
          Container(
            width: getProportionateScreenWidth(SizeConfig.screenWidth / 2.2),
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38),
              color: kSecondaryColor.withOpacity(0.05),
            ),
            child: const TextField(
              cursorColor: kSecondaryColor,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: kSecondaryColor,
                ),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: kSecondaryColor,
                ),
              ),
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
              children: [
                _chatBar(),
                Text("PENDING", style: textStyle),
                PendingUserList(
                  height: getProportionateScreenHeight(
                    SizeConfig.screenHeight * 0.30,
                  ),
                ),
                const SizedBox(height: 10),
                Text("CHATTERS", style: textStyle),
                ChatterUserList(
                  height: getProportionateScreenHeight(
                    SizeConfig.screenHeight / 2.85,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: _floatingActionButton(),
        bottomNavigationBar: _bottomNavBar(),
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

  _bottomNavBar() {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Row(),
    );
  }
}
