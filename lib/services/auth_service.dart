import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //login user
  Future loginUser(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  //sign up user
  Future signupUser(String username, String name, String email, String password,
      String confirmPass) async {
    try {
      UserCredential userCred = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await firestore.collection('users').doc(userCred.user!.uid).set({
        'uid': userCred.user!.uid,
        'username': username,
        'fullName': name,
        'email': email
      });
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  //logout user
  Future logoutUser() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }
}
