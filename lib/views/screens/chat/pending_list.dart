// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:chattr/utils/theme.dart';
import 'package:chattr/utils/constants.dart';
import 'package:chattr/utils/size_config.dart';
import 'package:chattr/views/screens/chat_messages/chat_messages.dart';

import 'chat_bloc.dart';

final _bloc = ChatBloc();

class PendingUserList extends StatelessWidget {
  const PendingUserList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SizedBox(
      height: getProportionateScreenHeight(
        (SizeConfig.screenHeight * 0.40) - (SizeConfig.appBarHeight + 30),
      ),
      width: getProportionateScreenWidth(SizeConfig.screenWidth),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Text("PENDING", style: textStyle),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _bloc.pendingList.length,
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
                        _bloc.pendingList[index].profilePic,
                      ),
                    ),
                    title: Text(
                      _bloc.pendingList[index].username,
                      style: textStyleBold,
                    ),
                    subtitle: Text(
                      _bloc.pendingList[index].message,
                      style: subTextStyle,
                    ),
                    trailing: _bloc.pendingList[index].unreadMSG != 0
                        ? CircleAvatar(
                            radius: 13,
                            backgroundColor: kLightGreen,
                            child: Text(
                              "${_bloc.pendingList[index].unreadMSG}",
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
        ],
      ),
    );
  }
}
