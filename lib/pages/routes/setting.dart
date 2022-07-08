// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class SettingSreen extends StatefulWidget {
  SettingSreen({Key? key}) : super(key: key);

  @override
  State<SettingSreen> createState() => _SettingSreenState();
}

class _SettingSreenState extends State<SettingSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text('Setting'),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          brightness: Brightness.light,
          primaryColor: Colors.purple,
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.black,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30.0),
                const SizedBox(height: 20.0),
                ListTile(
                  title: Text(
                    "Languages",
                    //style: whiteBoldText,
                  ),
                  subtitle: Text(
                    "English US",
                    //style: greyTExt,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/language');
                  },
                ),
                ListTile(
                  title: Text(
                    "Profile Settings",
                    // style: whiteBoldText,
                  ),
                  subtitle: Text(
                    "Klose",
                    // style: greyTExt,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                SwitchListTile(
                  title: Text(
                    "Email Notifications",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "On",
                    style: TextStyle(color: Colors.red),
                  ),
                  value: false,
                  onChanged: (val) {
                    setState(() {
                      activate();
                    });
                  },
                ),
                SwitchListTile(
                  title: Text(
                    "Access Location",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Off",
                    style: TextStyle(color: Colors.red),
                  ),
                  value: true,
                  onChanged: (val) {
                    setState(() {
                      activate();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
