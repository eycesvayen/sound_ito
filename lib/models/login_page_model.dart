import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPageModel with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void login(BuildContext context, email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      _showSnackbar(context, "Login successful");
    } on FirebaseAuthException catch (e) {
      _showSnackbar(context, e.message.toString());
    }
  }

  void regiser(BuildContext context) async {
    try {
      _auth.createUserWithEmailAndPassword(
          email: "huseyin@gmail.com", password: "123456");
      print(_auth.currentUser != null);
      _showSnackbar(context, "Register successful");
    } on FirebaseAuthException catch (e) {
      _showSnackbar(context, e.message.toString());
    }
  }

  void forgotPassword() async {
    _auth.sendPasswordResetEmail(email: "huseyin@gmail.com");
  }

  void _showSnackbar(BuildContext context, String message) {
    SnackBar snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void addUser() {
    _firestore.collection("address").doc().set({
      "username": "Huseyin",
      "email": "huseyin@gmail.com",
    });
  }
}
