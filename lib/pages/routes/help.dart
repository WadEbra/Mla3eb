// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  //const Help({required Key key}) : super(key: key);
  void _launchURL(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text("Help"),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "   if you are having trouble displaying the map or determining the location you are looking for , \n 1- make sure that you are connected to the internet \n 2- allow the application to access the site. \n 3- Or visit the following websites \n \n https://en-gb.FlutterHelper.com/  ",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
          buildSocialMediaIcons(),
        ],
      ),
    );
  }

  Widget buildSocialMediaIcons() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16),
      child: Row(
        children: [
          const SizedBox(
            width: 40,
            height: 200,
          ),
          buildIcon(FontAwesomeIcons.facebook, 'https://en-gb.facebook.com/'),
          const SizedBox(width: 30),
          buildIcon(FontAwesomeIcons.telegram, 'https://web.telegram.org/k/'),
        ],
      ),
    );
  }

  Widget buildIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: Icon(
        icon,
        color: Colors.green[400],
        size: 50,
      ),
    );
  }
}
