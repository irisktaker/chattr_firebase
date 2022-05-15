import 'package:chattr/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'shared/routes/routes.dart';
import 'package:flutter/services.dart';
import 'package:chattr/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chattr/views/bottom_navigation_bar.dart';
import 'package:chattr/views/screens/auth/login/login_screen.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
      // initialRoute: BottomNavigationBarTabs.routeScreen,
      // initialRoute: '/',
      home: StreamBuilder(
        stream: AuthController().authChanges,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            return const BottomNavigationBarTabs();
          } else {
            return LoginScreen();
          }
        },
      ),
      // routes: routes,
    );
  }
}
