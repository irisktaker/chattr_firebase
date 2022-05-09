// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:chattr/utils/theme.dart';
import 'package:chattr/utils/constants.dart';
import 'package:chattr/utils/size_config.dart';
import 'package:chattr/utils/singleton/singleton.dart';
import 'package:chattr/views/screens/chat/chat_bloc.dart';
import 'package:chattr/views/screens/chat_messages/chat_messages.dart';

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
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _chatBar(),
                Text("PENDING", style: textStyle),
                _usersList(
                  height: getProportionateScreenHeight(
                    SizeConfig.screenHeight * 0.28,
                  ),
                ),
                const SizedBox(height: 10),
                Text("CHATTERS", style: textStyle),
                _usersList(
                  height: getProportionateScreenHeight(
                      SizeConfig.screenHeight * 0.50),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
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
        ),
      ),
    );
  }

  _usersList({
    required double height,
    // required String profilePic,
    // required String username,
    // required String message,
    // required int unreadMSG,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: height,
      width: getProportionateScreenWidth(SizeConfig.screenWidth),
      child: StatefulBuilder(
        builder: (context, setState) => Expanded(
          child: ListView.builder(
            itemCount: Singleton.instance.usersList.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: MaterialButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ChatMessagesScreen(
                            userIndex: index,
                          );
                        },
                      ),
                    );
                  },
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white.withOpacity(0.4),
                      backgroundImage: NetworkImage(
                        _bloc.usersList[index].profilePic,
                      ),
                    ),
                    title: Text(
                      _bloc.usersList[index].username,
                      style: textStyleBold,
                    ),
                    subtitle: Text(
                      _bloc.usersList[index].message,
                      style: subTextStyle,
                    ),
                    trailing: _bloc.usersList[index].unreadMSG != 0
                        ? CircleAvatar(
                            radius: 13,
                            backgroundColor: kLightGreen,
                            child: Text(
                              "${_bloc.usersList[index].unreadMSG}",
                              style: const TextStyle(
                                fontSize: 13,
                                color: kTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : const Text(""),
                  ),
                ),
              );
            },
          ),
        ),
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
}
