// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntruScreen extends StatefulWidget {
  const IntruScreen({Key? key}) : super(key: key);

  @override
  State<IntruScreen> createState() => _IntruScreenState();
}

class _IntruScreenState extends State<IntruScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
