import 'package:chattr/views/screens/chat/chat_screen.dart';
import 'package:chattr/views/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:chattr/views/screens/auth/login/login_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const SplashScreen(),
  EmailSection.routeScreen: (context) => EmailSection(),
  PasswordSection.routeScreen: (context) => PasswordSection(),
  SetupProfileSection.routeScreen: (context) => SetupProfileSection(),
  ChatScreen.routeScreen: (context) => ChatScreen(),
};
