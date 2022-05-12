import 'package:flutter/material.dart';
import 'package:chattr/shared/constants.dart';
import 'package:chattr/shared/size_config.dart';


class ChatAppBar extends StatelessWidget {
  const ChatAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 12, bottom: 26),
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 30,
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
                        backgroundColor: kOnlineColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              width: getProportionateScreenWidth(SizeConfig.screenWidth / 2.5),
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
