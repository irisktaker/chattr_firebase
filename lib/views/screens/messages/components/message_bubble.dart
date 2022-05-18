import 'package:flutter/material.dart';

import 'package:chattr/shared/constants.dart';
import 'package:chattr/shared/size_config.dart';

class MessageBubbleWidget extends StatelessWidget {
  const MessageBubbleWidget(this.message,
      // this.username,
      // this.userImage,
      // this.isMe,
      {this.key})
      : super(key: key);

  @override
  final Key? key;
  final String message;
  // final String username;
  // final String userImage;
  // final bool isMe;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    bool isMe = true;

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.only(
            // top: 4,
            bottom: 4,
            left: isMe ? 60 : 8,
            right: isMe ? 8 : 60,
          ),
          constraints: BoxConstraints(
            maxWidth:
                getProportionateScreenWidth(SizeConfig.screenWidth * 0.60),
          ),
          decoration: BoxDecoration(
            color: isMe ? kYellow : kLightGreen,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: TextStyle(
                  color: isMe
                      ? Colors.black
                      : Theme.of(context).colorScheme.onBackground,
                ),
                textAlign: isMe ? TextAlign.start : TextAlign.start,
              )
            ],
          ),
        ),
      ],
    );
  }
}
