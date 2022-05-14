import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AuthBloc {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  String kEmailNullError = "Please Enter your email";
  String kPassNullError = "Please Enter your password";

  bool isLogin = true;
  String email = '';
  String password = '';
  String username = '';
  File? userImageFile;
  bool isLoading = false;

  void pickedImage(File pickedImage) {
    userImageFile = pickedImage;
  }

  void submitAuthForm(
    String email,
    String password,
    String username,
    File image,
    bool isLogin,
    BuildContext ctx,
    setState,
  ) async {
    UserCredential authResult;
    try {
      setState(() {
        isLoading = true;
      });

      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        final ref = FirebaseStorage.instance
            .ref()
            .child('user_image')
            .child(authResult.user!.uid + ".jpg");

        await ref.putFile(image);
        final url = ref.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user!.uid)
            .set(
          {
            'username': username,
            'password': password,
            'image_url': url,
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Error Occurred";

      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      }

      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );

      setState(() => isLoading = false);
    } catch (e) {
      print(e);

      setState(() => isLoading = false);
    }
  }

  // void submit(BuildContext context) {
  //   final _isValid = formKey.currentState!.validate();
  //   FocusScope.of(context).unfocus();

  //   // if (userImageFile == null) {
  //   //   ScaffoldMessenger.of(context).showSnackBar(
  //   //     SnackBar(
  //   //       content: const Text("Image is required"),
  //   //       backgroundColor: Theme.of(context).errorColor,
  //   //     ),
  //   //   );

  //   //   return;
  //   // }

  //   if (_isValid) {
  //     formKey.currentState!.save();

  //     submitFun(
  //       email.trim(),
  //       username.trim(),
  //       password.trim(),
  //       isLogin,
  //       context,
  //     );
  //   }
  // }
}
