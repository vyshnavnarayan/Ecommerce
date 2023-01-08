import 'package:ecommerce1/login/view/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupRepo {
  Future<void> createUser(String Name, String Email, BuildContext context,
      String PhoneNumber, String Password) async {
    final _auth = FirebaseAuth.instance;
    final CollectionReference userRef =
        FirebaseFirestore.instance.collection('usercollection');
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: Email,
        password: Password,
      );
      await userRef.doc(userCredential.user!.uid).set({
        'Username': Name,
        'Email': Email,
        'Phone': PhoneNumber,
        'Password': Password
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code)));
    }
  }
}
