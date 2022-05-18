import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:chattr/controllers/auth_controller.dart';
import 'package:chattr/views/screens/auth/login/login_screen.dart';

class ForgotPasswordBloc {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();

  bool isLoading = false;

  forgotPassword(BuildContext context , setState) async {
    setState(() => isLoading = true);
    String res =
        await AuthController().resetPassword(emailController.text);

    setState(() => isLoading = false);

    if (res != 'success') {
      return showSnackBar(res, context);
    } else {
      showSnackBar('email sent to email', context);
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }
}
