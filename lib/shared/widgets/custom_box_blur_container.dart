// ignore_for_file: must_be_immutable

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:chattr/shared/size_config.dart';

class CustomBoxBlurContainer extends StatelessWidget {
  CustomBoxBlurContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: getProportionateScreenWidth(SizeConfig.screenWidth),
      margin: const EdgeInsets.symmetric(horizontal: 33),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
          child: Container(
            width: getProportionateScreenHeight(SizeConfig.screenWidth - 66),
            padding: const EdgeInsets.all(36),
            color: Colors.white.withOpacity(0.6),
            child: child,
          ),
        ),
      ),
    );
  }
}
