// ignore_for_file: must_be_immutable

import 'package:chattr/shared/constants.dart';
import 'package:chattr/shared/size_config.dart';
import 'package:chattr/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.onButtonPressed,
    required this.buttonTitle,
  }) : super(key: key);

  void Function()? onButtonPressed;
  String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: kPrimaryColor,
      textColor: kTextColor,
      height: 60,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: kPrimaryColor,
        ),
      ),
      minWidth: getProportionateScreenHeight(SizeConfig.screenWidth - 36),
      onPressed: onButtonPressed,
      child: Text(
        buttonTitle,
        style: textButtonStyle,
      ),
    );
  }
}
