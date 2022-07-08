// ignore_for_file: non_constant_identifier_names, deprecated_member_use, unused_local_variable, unused_field

import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:firebase_database/firebase_database.dart';

class UserModel {
  final String firstName;
  final String email;
  final String password;
  final String lastName;
  final String phone;

  UserModel(
      this.email, this.password, this.firstName, this.lastName, this.phone);
}

class Authenti {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final DatabaseReference _userRef;

  Authenti(this.auth)
      : _userRef = FirebaseDatabase.instance.reference().child('users');
  final FirebaseAuth auth;
  void signup(String email, String password) {
    var res =
        auth.createUserWithEmailAndPassword(email: email, password: password);
    auth.signInWithEmailAndPassword(email: email, password: password);
  }
}


