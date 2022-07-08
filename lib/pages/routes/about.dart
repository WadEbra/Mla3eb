// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AboutScren extends StatefulWidget {
  const AboutScren({Key? key}) : super(key: key);

  @override
  State<AboutScren> createState() => _AboutState();
}

class _AboutState extends State<AboutScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        centerTitle: true,
        title: Text('About'),
      ),
      body: Center(
        child: Text(
          'About',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
