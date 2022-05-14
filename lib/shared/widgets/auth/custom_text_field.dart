// ignore_for_file: must_be_immutable

import 'package:chattr/shared/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
    required this.onSaved,
    required this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();
  String? Function(String?)? validator;
  void Function(String?)? onSaved;
  TextInputType? keyboardType;
  bool obscureText;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kBgColor.withOpacity(0.65),
      ),
      child: TextFormField(
        key: key,
        controller: controller,
        validator: validator,
        onSaved: onSaved,
        keyboardType: keyboardType,
        obscureText: obscureText,
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
}
