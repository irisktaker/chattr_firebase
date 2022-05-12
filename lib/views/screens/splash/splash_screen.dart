import 'dart:async';

import 'package:flutter/material.dart';
import 'package:chattr/shared/theme.dart';
import 'package:chattr/shared/constants.dart';
import 'package:chattr/shared/size_config.dart';
import 'package:chattr/views/screens/auth/components/email_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, EmailSection.routeScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: getProportionateScreenWidth(SizeConfig.screenWidth),
          height: getProportionateScreenHeight(SizeConfig.screenHeight),
          decoration: const BoxDecoration(
            color: kBgColor,
            image: DecorationImage(
              image: AssetImage(
                'assets/images/logo.jpeg',
              ),
            ),
          ),
          child: Column(
            children: [
              const Spacer(flex: 5),
              Center(
                child: Text(
                  "Chattr.",
                  style: headerStyle,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
