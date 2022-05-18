import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;
  Stream<User?> get authChanges => _firebaseAuth.authStateChanges();

  // function to add image to storage
  _addImageToStorage(Uint8List? image) async {
    Reference ref = _firebaseStorage
        .ref()
        .child('profileImage')
        .child(_firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putData(image!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  // function to enable users to pick an image
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('no image selected');
    }
  }

  // function to sign up user
  Future<String> signUp(
    String email,
    String username,
    String password,
    Uint8List? image,
  ) async {
    String res = "Error Occurred";
    try {
      if (email.isNotEmpty &&
          username.isNotEmpty &&
          username.isNotEmpty &&
          image != null) {
        UserCredential userCredential = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);

        String downloadUrl = await _addImageToStorage(image);

        await _firebaseStore
            .collection('users-list')
            .doc(userCredential.user!.uid)
            .set({
          'email': email,
          'username': username,
          'profileImage': downloadUrl,
        });

        res = 'success';
      } //.
      else {
        res = 'fields must not be empty';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        res = 'The account already exists for that email.';
      } else {
        return res;
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // function to login users
  Future<String> loginUser(String email, String password) async {
    String res = "Error Occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _firebaseAuth.signInWithEmailAndPassword(
            email: email.trim(), password: password.trim());

        res = 'success';
      } else {
        res = 'fields must not be empty';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        res = 'Wrong password provided for that user.';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // function to reset password
  resetPassword(String email) async {
    String res = 'some error occurred';

    try {
      if (email.isNotEmpty) {
        await _firebaseAuth.sendPasswordResetEmail(email: email);

        res = 'success';
      } else {
        res = 'email must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // function to sign out user
  Future signOut() async => await _firebaseAuth.signOut();

  // function to sign in with google
  signInWithGoogle() async {
    try {
      GoogleSignInAccount? _googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? _googleAuth =
          await _googleUser?.authentication;

      //. access to legal user data, and save it in authentication/users
      final _credential = GoogleAuthProvider.credential(
        idToken: _googleAuth?.idToken,
        accessToken: _googleAuth?.accessToken,
      );

      //. upload the data to the authentication/users
      UserCredential _userCredential =
          await _firebaseAuth.signInWithCredential(_credential);
      User? _user = _userCredential.user;
      if (_user != null) {
        // to not repeat the same user data
        if (_userCredential.additionalUserInfo!.isNewUser) {
          // if new user we need to save the user in our firebase database
          _firebaseStore.collection('users-list').doc(_user.uid).set({
            'email': _user.email,
            'username': _user.displayName,
            'profileImage': _user.photoURL,
          });
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
