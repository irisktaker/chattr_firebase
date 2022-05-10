import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:chattr/utils/constants.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'chat/chat_screen.dart';
import 'nearby/nearby_screen.dart';
import 'recent/recent_screen.dart';

class BottomNavigationBarTabs extends StatefulWidget {
  const BottomNavigationBarTabs({Key? key}) : super(key: key);
  static const routeScreen = 'btn_nav_bar_screen';

  @override
  State<BottomNavigationBarTabs> createState() =>
      _BottomNavigationBarTabsState();
}

class _BottomNavigationBarTabsState extends State<BottomNavigationBarTabs> {
  var _currentIndex = 0;

  late List<Map<String, dynamic>> _btnNavBarScreens;
  @override
  void initState() {
    super.initState();

    _btnNavBarScreens = [
      {'screen': const ChatScreen()},
      {'screen': const NearbyScreen()},
      {'screen': const RecentScreen()},
    ];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _btnNavBarScreens[_currentIndex]['screen'],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}
