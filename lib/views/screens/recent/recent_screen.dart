import 'dart:ui';

import 'package:chattr/utils/singleton/singleton.dart';
import 'package:flutter/material.dart';

import 'package:chattr/utils/theme.dart';
import 'package:chattr/utils/constants.dart';
import 'package:chattr/utils/size_config.dart';
import 'package:chattr/views/widgets/chat_app_bar.dart';
import 'package:chattr/views/screens/recent/recent_bloc.dart';

var _bloc = RecentBloc();

class RecentScreen extends StatelessWidget {
  const RecentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        height: getProportionateScreenHeight(
          (SizeConfig.screenHeight) - (SizeConfig.appBarHeight),
        ),
        width: getProportionateScreenWidth(SizeConfig.screenWidth),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const ChatAppBar(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Singleton.instance.recentCallsList.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: MaterialButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      // TODO
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return ChatMessagesScreen(
                      //         userIndex: index,
                      //       );
                      //     },
                      //   ),
                      // );
                    },
                    onLongPress: () {
                      // TODO:
                      _contactsDetails(context, index);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white.withOpacity(0.4),
                          backgroundImage: NetworkImage(
                            Singleton
                                .instance.recentCallsList[index].profilePic,
                          ),
                        ),
                        title: Text(
                          Singleton.instance.recentCallsList[index].username,
                          style: textStyleBold,
                        ),
                        subtitle: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Missed Calls
                              Singleton.instance.recentCallsList[index]
                                          .missedCall !=
                                      0
                                  ? Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        "(${Singleton.instance.recentCallsList[index].missedCall})",
                                        style: subTextStyle,
                                      ),
                                    )
                                  : const Text(""),

                              // Incoming or Outgoing
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(
                                  Singleton.instance.recentCallsList[index]
                                          .incomingCall
                                      ? Icons.phone_in_talk_outlined
                                      : Icons.phone_callback_outlined,
                                  size: 18,
                                  color: kSecondaryColor,
                                ),
                              ),

                              // Date Time
                              Text(
                                Singleton.instance.recentCallsList[index].date,
                                style: subTextStyle,
                              ),
                            ],
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          iconSize: 30,
                          icon: Icon(
                            Singleton.instance.recentCallsList[index].videoCall
                                ? Icons.video_call
                                : Icons.phone_enabled,
                          ),
                          color: kLightGreen,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: _floatingActionButton(),
    );
  }

  _floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: kPrimaryColor,
      foregroundColor: kIconsBorder,
      onPressed: () {},
      child: const Icon(
        Icons.phone_in_talk_outlined,
        size: 28,
      ),
    );
  }

  _contactsDetails(context, index) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        buttonPadding: const EdgeInsets.all(0),
        contentPadding: const EdgeInsets.all(0),
        insetPadding: const EdgeInsets.all(0),
        elevation: 0,
        actionsOverflowButtonSpacing: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(60.0),
          ),
        ),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 20.0),
              child: Container(
                width:
                    getProportionateScreenHeight(SizeConfig.screenWidth - 66),
                padding: const EdgeInsets.all(36),
                color: Colors.grey.withOpacity(0.4),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 25,
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
                                    backgroundColor: kBusyColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          Singleton.instance.recentCallsList[index].username,
                          style: textStyleBold,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            color: kSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Incoming or Outgoing
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Singleton.instance.recentCallsList[index]
                                    .incomingCall
                                ? Icons.phone_in_talk_outlined
                                : Icons.phone_callback_outlined,
                            size: 18,
                            color: kSecondaryColor,
                          ),
                        ),

                        // Date Time
                        Text(
                          Singleton.instance.recentCallsList[index].date,
                          style: const TextStyle(
                            color: kSecondaryColor,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        Text("24:07"),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Container(
                          width: getProportionateScreenWidth(
                              SizeConfig.screenWidth / 2.5),
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(38),
                            color: kSecondaryColor.withOpacity(0.05),
                          ),
                          child: TextField(
                            cursorColor: kSecondaryColor,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(38),
                                borderSide: BorderSide(
                                  color: kSecondaryColor.withOpacity(0.7),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(38),
                                borderSide: BorderSide(
                                  color: kSecondaryColor.withOpacity(0.7),
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.chat_bubble_outline,
                                color: kSecondaryColor.withOpacity(0.6),
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: const CircleAvatar(
                            radius: 18,
                            backgroundColor: kPrimaryColor,
                            foregroundColor: kIconsBorder,
                            child: Icon(
                              Icons.phone_callback_outlined,
                              size: 18,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        InkWell(
                          onTap: () {},
                          child: const CircleAvatar(
                            radius: 18,
                            backgroundColor: kPrimaryColor,
                            foregroundColor: kIconsBorder,
                            child: Icon(
                              Icons.video_call_outlined,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
