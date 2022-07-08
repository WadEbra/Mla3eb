// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Authenticatooin {
  String email = '';
  String password = '';
  final TextEditingController _emailcontrl = TextEditingController();
  final TextEditingController _passwordcontrl = TextEditingController();

  GlobalKey<ScaffoldState> scaffkey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> fkey = GlobalKey<FormState>();

  bool isLoading = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  void showtoast() {
    Fluttertoast.showToast(
      msg: "تم تسجيل الدخول بنجاح",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 10,
      backgroundColor: Colors.green[200],
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }

  Future login(TextEditingController emailcontrl, String password) async {
    final form = fkey.currentState;
    try {
      var auther = FirebaseAuth.instance;
      await auther.signInWithEmailAndPassword(
          email: _emailcontrl.text.trim(),
          password: _passwordcontrl.text.trim());

      // Create Firebase account

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('User Not Found');
      } else if (e.code == 'wrong-password') {
        print('Wrong Password');
      }
      if (e.code == 'weak-password') {
        //////////////
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
