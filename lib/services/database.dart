// ignore_for_file: unused_import

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_apps/services/user_model.dart';

import 'package:firebase_auth/firebase_auth.dart';



class DatabaseServices {
  final String uid;
  // User collection
  final userCollection = FirebaseFirestore.instance.collection('users');

  DatabaseServices({required this.uid});

  Future updateUser() async {}

  addUser(UserModel user) {}

  getUser() {}

  

  // Future<UserModel> getUser() async {
  //   final snapshot = await userCollection.doc(uid).get();
  //   log('Data: ${snapshot.data()}');
  //   final model = UserModel.fromJson(snapshot.data()!);
  //   return model;
  // }
}
