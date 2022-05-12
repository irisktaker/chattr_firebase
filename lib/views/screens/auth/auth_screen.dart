// ignore_for_file: must_be_immutable

import 'package:chattr/shared/size_config.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  static const routeScreen = 'auth_screen';

  AuthScreen({
    Key? key,
    required this.bgImage,
    required this.childWidget,
  }) : super(key: key);

  String bgImage;
  Widget childWidget;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: getProportionateScreenWidth(SizeConfig.screenWidth),
          height: getProportionateScreenWidth(SizeConfig.screenHeight),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover,
            ),
          ),
          child: childWidget,
        ),
      ),
    );
  }
}
