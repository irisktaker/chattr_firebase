import 'package:flutter/material.dart';

class AuthBloc {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  String kEmailNullError = "Please Enter your email";
  String kPassNullError = "Please Enter your password";
}
