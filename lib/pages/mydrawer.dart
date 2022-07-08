// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

var currentUser = FirebaseAuth.instance.currentUser;

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.green[200],
      semanticLabel: 'Search for a stadium',
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            arrowColor: Colors.redAccent,
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('images/11.jpg'),
            ),
            accountName: Text(
              '${currentUser!.displayName}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(" ${currentUser!.email}"),
          ),
          ListTile(
            title: const Text(
              'Payment',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: const Icon(Icons.payment),
            onTap: () {
              Navigator.pushNamed(context, '/payment');
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Settings',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'help',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: const Icon(Icons.help),
            onTap: () {
              Navigator.pushNamed(context, '/help');
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'about',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: const Icon(Icons.info),
            onTap: () {
              Navigator.pushNamed(context, '/About');
            },
          ),
          const Divider(),
          ListTile(
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(Icons.logout),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              }),
        ],
      ),
    );
  }
}
