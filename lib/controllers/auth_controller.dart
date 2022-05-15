import 'dart:io';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get user => _firebaseAuth.currentUser;
  late UserCredential userCredential;

  // SIGN UP METHOD
  Future signUp(BuildContext context,
      {required String email, required String password, File? image}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final Reference ref = FirebaseStorage.instance
          .ref()
          .child('user_image')
          .child(userCredential.user!.uid + ".jpg");

      await ref.putFile(image!);
      final url = ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection('users_list')
          .doc(userCredential.user!.uid)
          .set(
        {
          'email': email,
          'password': password,
          'image_url': url,
        },
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Error Occurred";

      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } catch (e) {
      return e.toString();
    }
  }

  // SIGN IN METHOD
  Future signIn(BuildContext context,
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Error Occurred";

      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } catch (e) {
      return e.toString();
    }
  }

  // SIGN OUT
  Future signOut() async {
    await _firebaseAuth.signOut();
    print('User Sign Out');
  }
}
