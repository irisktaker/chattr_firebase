import 'package:flutter/material.dart';

import 'package:chattr/routes/routes.dart';
import 'package:flutter/services.dart';
import 'views/screens/bottom_navigation_bar.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
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
      initialRoute: BottomNavigationBarTabs.routeScreen,
      routes: routes,
    );
  }
}
