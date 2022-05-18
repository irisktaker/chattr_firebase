import 'package:chattr/views/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chattr/controllers/auth_controller.dart';

class LoginBloc {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

    bool isLoading = false;

  loginUser(BuildContext context, setState) async {
    setState(() => isLoading = true);

    String res = await AuthController().loginUser(
      emailController.text,
      passwordController.text,
    );

    setState(() => isLoading = false);

    if (res != 'success') {
      return showSnackBar(res, context);
    } else {
      showSnackBar('Login successfully', context);
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChatScreen()),
      );
    }
  }
}
