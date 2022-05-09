import 'package:chattr/views/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chattr/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chattr',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: ChatScreen.routeScreen,
      routes: routes,
    );
  }
}
