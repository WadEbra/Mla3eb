// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, sized_box_for_whitespace, unnecessary_null_comparison, use_build_context_synchronously, non_constant_identifier_names, unused_import, unused_local_variable, avoid_print, deprecated_member_use, duplicate_ignore, duplicate_import, unused_field, unrelated_type_equality_checks
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:course_apps/pages/home_screen.dart';
import 'package:course_apps/pages/routes/reset_pawword.dart';
import 'package:course_apps/pages/routes/sign_up.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  bool showSpinner = false;
  GlobalKey<ScaffoldState> scaffkey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> fkey = GlobalKey<FormState>();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();
  final TextEditingController _emailcontrl = TextEditingController();
  final TextEditingController _passwordcontrl = TextEditingController();
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

  ////////////////////////////////////////////////////////////////////////////////////////////////////
  ///                                                                                          //////
  ///                       LOGIN METHOD With Firbase                                           ////                                                         /////
  ///                                                                                         //////
  ///////////////////////////////////////////////////////////////////////////////////////////////////
  Future login() async {
    final form = fkey.currentState;
    try {
      var auther = FirebaseAuth.instance;
      await auther.signInWithEmailAndPassword(
          email: _emailcontrl.text.trim(),
          password: _passwordcontrl.text.trim());
      if (auther.currentUser != null) {
        showtoast();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {}
      // Create Firebase account

    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.code),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 10,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 8),
      ));
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

  ////////////////////////////////////////////////////////////////////////////  ///
  ///                                                                         ///
  ///                             End of LOGIN METHOD
  ///                                                                         ///
  ///                                                                         ///
  ///                                                                       /////
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print("Error Occurred: ${e.toString()} ");
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _UpdateConnectionState(result);
  }

  Future<void> _UpdateConnectionState(ConnectivityResult result) async {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      showStatus(result, true);
    } else {
      showStatus(result, false);
    }
  }

  void showStatus(ConnectivityResult result, bool status) {
    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        // side: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 10,
      duration: Duration(seconds: 5),
      content: Text(
        result == ConnectivityResult.mobile
            ? 'You are connected to Mobile Network'
            : result == ConnectivityResult.wifi
                ? 'You are connected to Wifi'
                : 'You are not connected to Internet',
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: result == ConnectivityResult.mobile
          ? Colors.green
          : result == ConnectivityResult.wifi
              ? Colors.green
              : Colors.red,
    );
    // final snackBar = SnackBar(
    //     content:
    //         Text("${status ? 'ONLINE\n' : 'OFFLINE\n'}${result.toString()} "),
    //     backgroundColor: status ? Colors.green : Colors.red);
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  void initState() {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_UpdateConnectionState);
    super.initState();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffkey,
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: null,
          backgroundColor: Colors.green[400],
          title: Text("Log in ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    'images/field.png',
                    width: 300,
                    height: 300,
                  ),
                ),

                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    onChanged: (value) {
                      email = value;
                      //Do something with the user input.
                    },

                    keyboardType: TextInputType.emailAddress,
                    // textAlign: TextAlign.center,
                    controller: _emailcontrl,

                    style: TextStyle(color: Colors.green[500]),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.green),
                      labelStyle: TextStyle(color: Colors.green),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 20,
                      ),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com',
                    ),

                    validator: (val) => !val!.contains("@gmail.com")
                        ? "Email  is not Valid"
                        : null,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    onChanged: (value) {
                      password = value;
                      //Do something with the user input.
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: _passwordcontrl,
                    style: TextStyle(color: Colors.green[500]),
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.green),
                        labelStyle: TextStyle(color: Colors.green),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          gapPadding: 20,
                        ),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                    validator: (value) {
                      if (value != null && value.length < 6) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),

                // ignore: deprecated_member_use

                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                ),
                TextButton.icon(
                  icon: Icon(Icons.help_center_sharp,
                      size: 30, color: Colors.green),
                  label: Text(
                    "Forget the Password?",
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    // Navigator.pushNamed(context, SignUp.name);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasswordReset(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 5,
                  width: 10,
                ),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.green[500],
                      borderRadius: BorderRadius.circular(60)),
                  child: TextButton(
                    onPressed: () {
                      if (email.isEmpty || password.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.green[100],
                                title: Text('Error'),
                                content: Text('Please fill all the fields'),
                                actions: <Widget>[
                                  // ignore: deprecated_member_use
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
                        login();
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.green[400],
                          borderRadius: BorderRadius.circular(50)),
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.green,
                            textStyle: const TextStyle(
                              fontSize: 25,
                            )),
                        //clipBehavior: Clip.antiAliasWithSaveLayer,
                        icon: Icon(Icons.person_add),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        label: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
