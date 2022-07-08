// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class CutomTextField extends StatelessWidget {
  final isPassword;
  final String hint;
  final IconData icon;
  final Function onChange;
  final TextInputType type;
  final TextEditingController con;
  CutomTextField(
      {Key? key,
      this.isPassword,
      required this.hint,
      required this.icon,
      required this.onChange,
      required this.con,
      required this.type,
      required String? Function(dynamic val) validator,
      required List inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var onChange;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(
            icon,
          ),
        ),
        obscureText: isPassword ? isPassword : false,
        keyboardType: type,
        onChanged: onChange,
        validator: (txt) {
          if (txt == '') {
            return 'Empty Text';
          }
          return null;
        },
        controller: con,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @required
  final text;
  final VoidCallback longinFunc;
  const CustomButton({
    Key? key,
    this.text,
    required this.longinFunc(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 100,
      height: 55,
      child: ElevatedButton.icon(
        onPressed: longinFunc,
        icon: Icon(Icons.login),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
