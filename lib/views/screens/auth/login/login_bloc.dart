import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginBloc {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}
