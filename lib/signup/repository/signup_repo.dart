import 'package:ecommerce1/login/view/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class SignupRepo {
  final _auth = FirebaseAuth.instance;
    final CollectionReference userRef =
        FirebaseFirestore.instance.collection('sellercollection');
  Future<void> createUser(String name, String email, BuildContext context,
      String phoneNumber, String password) async {
    
   
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userRef.doc(userCredential.user!.uid).set({
        'username': name,
        'email': email,
        'phone': phoneNumber,
        'password': password,
        'user_id': _auth.currentUser!.uid,
        'profile_photo': "",
        'type': 'seller'
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code)));
    }
  }
  void updateDetails(String user_id, String name, String email, String description, String phoneNumber, String password) {
    userRef
        .doc(user_id)
        .update({'username': name, 'email': email, 'phone': phoneNumber,'password': password,});
  }
}
