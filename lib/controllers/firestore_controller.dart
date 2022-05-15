import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void addUserToFirestore() async {
    try{
      await _firestore.collection('users_list').doc(_auth.currentUser!.uid).collection('');
    }catch(e) {}
  }
}
