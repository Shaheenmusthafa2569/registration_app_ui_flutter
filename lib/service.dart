import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/home.dart';
import 'package:login_page/profile.dart';

Future<void> Signup(
  String imageurl,
  String name,
  String email,
  String password,
  BuildContext context,
) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await FirebaseFirestore.instance
        .collection("datas")
        .doc(userCredential.user?.uid)
        .set({
          "Name": name,
          "Email": email,
          "Password": password,
          "Image": imageurl,
        });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Registered successfully.")));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
  ;
}

Future<void> login(String emaill, String password, BuildContext context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emaill, password: password);
    User? user = userCredential.user;
    DocumentSnapshot userdoc = await FirebaseFirestore.instance
        .collection('datas')
        .doc(user?.uid)
        .get();
    String username = userdoc["Name"] ?? 'User';
    String useremail = userdoc['Email'] ?? emaill;
    String userpassword = userdoc['Password'] ?? '';
    String userimageurl = userdoc['Image'] ?? "no image";

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Login successful")));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Myprofilepage(
          username: username,
          email: useremail,
          password: userpassword,
          imageurl: userimageurl,
        ),
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Future<void> Forgot(String email, BuildContext context) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Code sent, Check your email")));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}
