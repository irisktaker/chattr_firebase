import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:chattr/shared/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chattr/controllers/auth_controller.dart';
import 'package:chattr/views/screens/chat/chat_screen.dart';

class RegisterBloc {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  Uint8List? image;
  bool isLoading = false;

  signUpUser(BuildContext context, setState) async {
    setState(() => isLoading = true);

    String res = await AuthController().signUp(
      emailController.text,
      usernameController.text,
      passwordController.text,
      image,
    );
    setState(() => isLoading = false);

    if (res != 'success') {
      return showSnackBar(res, context);
    } else {
      showSnackBar('Sing up successfully', context);
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChatScreen()),
      );
    }
  }

  _pickedImageFromGallery(setState) async {
    Uint8List _image = await AuthController().pickImage(ImageSource.gallery);
    setState(() => image = _image);
  }

  _pickedImageFromCamera(setState) async {
    Uint8List _image = await AuthController().pickImage(ImageSource.camera);
    setState(() => image = _image);
  }

  showAlertDialog(BuildContext context, setState) {
    AlertDialog alert = AlertDialog(
      title: Column(
        children: [
          MaterialButton(
            onPressed: () {
              // TODO: ___
            },
            child: const Text(
              "Delete Photo",
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          ),
          const Divider(),
          MaterialButton(
            onPressed: () {
              _pickedImageFromCamera(setState);
            },
            child: const Text(
              "Take Photo",
              style: TextStyle(color: kPrimaryColor, fontSize: 18),
            ),
          ),
          const Divider(),
          MaterialButton(
            onPressed: () {
              _pickedImageFromGallery(setState);
            },
            child: const Text(
              "Choose Photo",
              style: TextStyle(color: kPrimaryColor, fontSize: 18),
            ),
          ),
          const Divider(),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: kPrimaryColor, fontSize: 18),
            ),
          ),
        ],
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
