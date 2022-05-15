import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _firebaseStore = FirebaseFirestore.instance;
  Stream<User?> get authChanges => _firebaseAuth.authStateChanges();
  User get user => _firebaseAuth.currentUser!;

  // SIGN UP METHOD
  Future signUp(BuildContext context,
      {required String email,
      required String username,
      required String password,
      File? image}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        // to not repeat the same user data
        if (userCredential.additionalUserInfo!.isNewUser) {
          // if new user we need to save the user in our firebase database
          _firebaseStore.collection('users_list').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'user_image': user.photoURL,
          });
        }
      }
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
