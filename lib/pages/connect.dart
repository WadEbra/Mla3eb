// ignore_for_file: unrelated_type_equality_checks, unused_local_variable

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Connectiion  {
  
  // StreamSubscription? connection
  void showConnwctionSnackBar()async{
    final result = Connectivity();
    final snackbar = SnackBar(
      content: Text(
        result == ConnectivityResult.mobile
            ? 'You are connected to Mobile Network'
            : result == ConnectivityResult.wifi
                ? 'You are connected to Wifi'
                : 'You are not connected to Internet',
        style: const TextStyle(color: Colors.red),
      ),
      backgroundColor: result == ConnectivityResult.mobile
          ? Colors.green
          : result == ConnectivityResult.wifi
              ? Colors.blue
              : Colors.red,
    );
  }

  
  
}