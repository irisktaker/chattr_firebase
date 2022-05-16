import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

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

  // SIGN UP METHOD
  Future signUp(
    // BuildContext context,
    String email,
    String username,
    String password,
    Uint8List? image,
  ) async {
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

        print(userCredential.user!.email);
      } else {
        print('something went wrong');
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Error Occurred";

      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }

      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(errorMessage),
      //     backgroundColor: Theme.of(context).errorColor,
      //   ),
      // );
    } catch (e) {
      return e.toString();
    }
  }

  // SIGN IN METHOD
  Future signIn(BuildContext context,
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
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
