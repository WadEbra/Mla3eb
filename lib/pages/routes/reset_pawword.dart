// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors, unnecessary_const, avoid_print, must_be_immutable, unused_field, use_build_context_synchronously, nullable_type_in_catch_clause, unused_import

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final TextEditingController _emailController = TextEditingController();
  String _email = '';
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future restpass() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text);
      // email:_emailController.text.trim(),

    } on FirebaseAuthException catch (e) {
      print(e);

      print(e.message);
      Fluttertoast.showToast(
        msg: '${e.message}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        fontSize: 16.0,
        textColor: Colors.white,
        timeInSecForIosWeb: 10,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        automaticallyImplyLeading: true,
        title: Text('Reset Password'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset("images/field.png"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Forgot your password?",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          "Enter Your Email to reset Password.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        onChanged: (value) {
                          _email = value;
                        },
                        style: TextStyle(color: Colors.green[500]),
                        decoration: InputDecoration(
                          fillColor: Colors.green,
                          focusColor: Colors.green,
                          labelStyle: TextStyle(color: Colors.green),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.greenAccent,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            gapPadding: 15,
                          ),
                          labelText: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.green[500],
                            borderRadius: BorderRadius.circular(30)),
                        child: TextButton(
                            child: Text(
                              'Reset',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            onPressed: () {
                              restpass();
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
