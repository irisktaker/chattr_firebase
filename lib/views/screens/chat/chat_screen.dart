// ignore_for_file: must_be_immutable

import 'package:chattr/utils/constants.dart';
import 'package:chattr/utils/size_config.dart';
import 'package:chattr/utils/theme.dart';
import 'package:chattr/views/screens/chat/chat_bloc.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  static const routeScreen = 'chat_screen';
  final _bloc = ChatBloc();

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
              children: [
                _chatBar(),
                Text("PENDING", style: textStyle),
                _usersList(
                  height: getProportionateScreenHeight(
                      SizeConfig.screenHeight / 3.6),
                ),
                const SizedBox(height: 10),
                Text("CHATTERS", style: textStyle),
                _usersList(
                  height: getProportionateScreenHeight(SizeConfig.screenHeight),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _usersList({required double height}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: height,
      width: getProportionateScreenWidth(SizeConfig.screenWidth),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white.withOpacity(0.4),
                backgroundImage: const NetworkImage(
                  "https://images.unsplash.com/photo-1608155686393-8fdd966d784d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                ),
              ),
              title: Text(
                "Dan Wells",
                style: textStyleBold,
              ),
              subtitle: Text(
                "You know this, right!",
                style: subTextStyle,
              ),
              trailing: const CircleAvatar(
                radius: 13,
                backgroundColor: kLightGreen,
                child: Text(
                  "3",
                  style: TextStyle(
                    fontSize: 13,
                    color: kTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

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
              "https://images.unsplash.com/photo-1608155686393-8fdd966d784d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
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
}
