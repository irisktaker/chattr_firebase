
import 'package:flutter/material.dart';

import 'package:chattr/views/bottom_navigation_bar.dart';
import 'package:chattr/views/screens/chat/chat_screen.dart';
import 'package:chattr/views/screens/splash/splash_screen.dart';
import 'package:chattr/views/screens/messages/messages_screen.dart';
import 'package:chattr/views/screens/auth/components/email_screen.dart';
import 'package:chattr/views/screens/auth/components/setup_screen.dart';
import 'package:chattr/views/screens/auth/components/password_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const SplashScreen(),
  EmailSection.routeScreen: (context) => EmailSection(),
  PasswordSection.routeScreen: (context) => PasswordSection(),
  SetupProfileSection.routeScreen: (context) => SetupProfileSection(),
  BottomNavigationBarTabs.routeScreen: (context) =>
      const BottomNavigationBarTabs(),
  ChatScreen.routeScreen: (context) => const ChatScreen(),
  ChatMessagesScreen.routeScreen: (context) => const ChatMessagesScreen(),
};
