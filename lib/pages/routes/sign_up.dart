// ignore_for_file: unused_field, prefer_const_constructors, avoid_print, deprecated_member_use, use_build_context_synchronously, unused_element, sized_box_for_whitespace, unnecessary_null_comparison, unused_import, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_apps/pages/routes/log_in.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isLoading = true;
  final scaffkey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> fkey = GlobalKey<FormState>();

  String email = "";

  String fname = "";

  String lname = "";

  String phone = "";

  String password = "";

  final TextEditingController econ = TextEditingController();

  final TextEditingController pcon = TextEditingController();

  final TextEditingController fcon = TextEditingController();

  final TextEditingController lcon = TextEditingController();

  final TextEditingController phcon = TextEditingController();

  Future<void> getUser() async {
    User user = FirebaseAuth.instance.currentUser!;
    if (user != null) {
      print(user.uid);
    } else {
      print("no user");
    }
  }

////////////////////////////////////////////////////////////////////////////////////
  ///                  create new account with firebase ////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
  Future signup() async {
    ///////////////////
    //final ifValid = fkey.currentState!.validate();                /////////////
    try {
      /////////
      // Create Firebase account                                          ///////
      FirebaseAuth auther = FirebaseAuth.instance; /////////
      await auther.createUserWithEmailAndPassword(
        /////////
        email: econ.text.trim(), /////////
        password: pcon.text.trim(), /////////
      ); /////////

      //Create Firebase Firestore Colllection                            ////////
      FirebaseFirestore.instance //////
          .collection('users') //////
          .doc(FirebaseAuth.instance.currentUser!.uid) ///////
          .set({
        ///////
        "fname": fcon.text.trim(), //////
        'lname': lcon.text.trim(), //////
        'phone': phcon.text.trim(),
        'email': econ.text.trim(),
      });

      if (auther.currentUser != null) {
        // Create user profile
        User user = FirebaseAuth.instance.currentUser!;
        await user.reload();
        print("user created${user.displayName!}");
        // Navigate to home page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        print('error');
      }
      print('Firebase account created');
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.code),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ));
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffkey,
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text('Sign Up',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.green[400],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Form(
              autovalidateMode: AutovalidateMode.always,
              key: fkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset(
                      'images/field.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      // textAlign: TextAlign.center,
                      controller: fcon,
                      onChanged: (value) {
                        fname = value;

                        //Do something with the user input.
                      },

                      style: TextStyle(color: Colors.green[500]),
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.account_circle, color: Colors.green),
                        labelStyle: TextStyle(color: Colors.green),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          gapPadding: 10,
                        ),
                        labelText: 'First name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if (value.length < 4) {
                          return 'Too short';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      // textAlign: TextAlign.center,
                      controller: lcon,
                      onChanged: (value) {
                        lname = value;
                        //Do something with the user input.
                      },
                      style: TextStyle(color: Colors.green[500]),
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.account_circle, color: Colors.green),
                        labelStyle: TextStyle(color: Colors.green),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          gapPadding: 10,
                        ),
                        labelText: 'last name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if (value.length < 4) {
                          return 'Too short';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      // textAlign: TextAlign.center,
                      controller: econ,
                      onChanged: (value) {
                        email = value;
                        //Do something with the user input.
                      },
                      style: TextStyle(color: Colors.green[500]),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.green),
                        labelStyle: TextStyle(color: Colors.green),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          gapPadding: 10,
                        ),
                        labelText: 'Email',
                      ),
                      validator: (val) {
                        return !val!.contains("@gmail.com")
                            ? "Email Id is not Valid"
                            : null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      // textAlign: TextAlign.center,
                      controller: phcon,

                      onChanged: (value) {
                        phone = value;
                        //Do something with the user input.
                      },
                      style: TextStyle(color: Colors.green[500]),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone, color: Colors.green),
                        labelStyle: TextStyle(color: Colors.green),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          gapPadding: 10,
                        ),
                        labelText: 'phone number',
                      ),
                      validator: (val) {
                        if (val!.length > 10 && !val.contains("09  ")) {
                          return "Phone Number is not Valid";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      // textAlign: TextAlign.center,
                      controller: pcon,
                      onChanged: (value) {
                        password = value;
                        //Do something with the user input.
                      },
                      style: TextStyle(color: Colors.green[500]),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.green),
                        labelStyle: TextStyle(color: Colors.green),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          gapPadding: 10,
                        ),
                        labelText: 'password',
                      ),
                      validator: (value) {
                        if (value != null && value.length < 6) {
                          return 'Password must be at least 8 characters in length';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: 25,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.green[500],
                        borderRadius: BorderRadius.circular(30)),
                    child: TextButton(
                      onPressed: () {
                        if (fkey.currentState!.validate()) {
                          print(fname);
                          print(lname);
                          print(email);
                          print(phone);
                          getUser();
                        }
                        if (email.isEmpty || password.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.green[100],
                                  title: Text('Error'),
                                  content: Text('Please fill all the fields'),
                                  actions: <Widget>[
                                    FlatButton(
                                      color: Colors.green[400],
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        } else {
                          print(fname);

                          signup();
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
