import 'package:flutter/material.dart';

import 'package:chattr/views/bottom_navigation_bar.dart';
import 'package:chattr/views/screens/chat/chat_screen.dart';
import 'package:chattr/views/screens/splash/splash_screen.dart';
import 'package:chattr/views/screens/messages/messages_screen.dart';
import 'package:chattr/views/screens/auth/login/login_screen.dart';
import 'package:chattr/views/screens/auth/register/register_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const SplashScreen(),
  LoginScreen.routeScreen: (context) => LoginScreen(),
  // RegisterScreen.routeScreen: (context) => RegisterScreen(),
  BottomNavigationBarTabs.routeScreen: (context) =>
      const BottomNavigationBarTabs(),
  ChatScreen.routeScreen: (context) => const ChatScreen(),
  ChatMessagesScreen.routeScreen: (context) => const ChatMessagesScreen(),
};
