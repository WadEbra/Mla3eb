// ignore_for_file: avoid_print, unused_field

import 'package:course_apps/services/database.dart';
import 'package:course_apps/services/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  Future<bool> singup(UserModel user) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email, password: user.password);
      User firebaseUser = userCredential.user!;
      await DatabaseServices(uid: firebaseUser.uid).addUser(user);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
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

  Future<bool> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User firebaseUser = userCredential.user!;
      final model = await DatabaseServices(uid: firebaseUser.uid).getUser();
      if (model != null) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
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

  final FirebaseAuth _auth = FirebaseAuth.instance;

  

  

  deleteUser(email, password) {
    
  }
}

