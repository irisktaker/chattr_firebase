// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:chattr/utils/constants.dart';
import 'package:chattr/utils/size_config.dart';
import 'package:chattr/utils/theme.dart';
import 'package:flutter/material.dart';

class CustomBoxBlurContainer extends StatelessWidget {
  CustomBoxBlurContainer({
    Key? key,
    required this.head1,
    required this.head2,
    required this.controller,
    required this.buttonTitle,
    this.customWidget,
    required this.onButtonPressed,
    this.hintText,
  }) : super(key: key);

  Widget head1;
  Widget head2;
  TextEditingController controller;
  String buttonTitle;
  Widget? customWidget;
  void Function()? onButtonPressed;
  String? hintText;

  _customButton() {
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

  _customTextFiled({String? hintText}) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kBgColor.withOpacity(0.65),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: kPrimaryColor,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(60),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
        child: Container(
          width: getProportionateScreenHeight(SizeConfig.screenWidth - 66),
          padding: const EdgeInsets.all(36),
          color: Colors.white.withOpacity(0.6),
          child: Column(
            children: [
              head1,
              const SizedBox(height: 14),
              head2,
              const SizedBox(height: 16),
              _customTextFiled(hintText: hintText),
              const SizedBox(height: 22),
              _customButton(),
              Container(
                child: customWidget,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
