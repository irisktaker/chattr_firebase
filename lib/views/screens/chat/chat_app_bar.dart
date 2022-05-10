import 'package:chattr/utils/constants.dart';
import 'package:chattr/utils/size_config.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 26),
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
              height: 35,
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
      ),
    );
  }
}
