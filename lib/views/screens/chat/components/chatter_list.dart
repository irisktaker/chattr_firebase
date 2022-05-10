// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:chattr/utils/theme.dart';
import 'package:chattr/utils/constants.dart';
import 'package:chattr/utils/size_config.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:chattr/views/screens/messages/messages_screen.dart';

import '../chat_bloc.dart';

final _bloc = ChatBloc();

class ChatterUserList extends StatelessWidget {
  const ChatterUserList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(
        (SizeConfig.screenHeight * 0.60) - (SizeConfig.appBarHeight),
      ),
      width: getProportionateScreenWidth(SizeConfig.screenWidth),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Text("CHATTERS", style: textStyle),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _bloc.chattersList.length,
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Slidable(
                      key: const ValueKey(0),
                      endActionPane: ActionPane(
                        dragDismissible: false,
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(onDismissed: () {}),
                        children: [
                          SlidableAction(
                            onPressed: (value) {
                              // TODO: Make dynamic changing between pending and chatter

                              // setState(() {
                              //   _bloc.chattersList[index].isPending =
                              //       !_bloc.chattersList[index].isPending;
                              // });
                            },
                            backgroundColor: kLightGreen,
                            foregroundColor: kBgColor,
                            icon: Icons.pin_drop,
                          ),
                          SlidableAction(
                            onPressed: (value) {},
                            backgroundColor: kLightGreen,
                            foregroundColor: kBgColor,
                            icon: Icons.volume_off,
                          ),
                          SlidableAction(
                            onPressed: (value) {},
                            backgroundColor: kLightGreen,
                            foregroundColor: kBgColor,
                            icon: Icons.delete_outline,
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white.withOpacity(0.4),
                            backgroundImage: NetworkImage(
                              _bloc.chattersList[index].profilePic,
                            ),
                          ),
                          title: Text(
                            _bloc.chattersList[index].username,
                            style: textStyleBold,
                          ),
                          subtitle: Text(
                            _bloc.chattersList[index].message,
                            style: subTextStyle,
                          ),
                          trailing: _bloc.chattersList[index].unreadMSG != 0
                              ? CircleAvatar(
                                  radius: 13,
                                  backgroundColor: kLightGreen,
                                  child: Text(
                                    "${_bloc.chattersList[index].unreadMSG}",
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
                    ),
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
