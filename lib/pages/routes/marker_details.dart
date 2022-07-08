// // ignore_for_file: prefer_const_constructors

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class Markerredetails {
//   final Completer<GoogleMapController> _controller = Completer();
//   List<Marker> _markers = [];

//   @override
//   Future getPer() async {
//     bool services;
//     LocationPermission per = await Geolocator.checkPermission();

//     if (per == LocationPermission.denied) {
//       await Geolocator.requestPermission();
//       services = await Geolocator.isLocationServiceEnabled();
//       if (services) {
//         print('services');
//       } else {
//         print('services not');
//       }
//     }
//     getCurrnetLocation();
//   }

//   intlize() async {
//     Marker firstMarker = Marker(
//       anchor: const Offset(0.5, 0.5),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//       markerId: const MarkerId('ملاعب الاصلاحية'),
//       position: LatLng(15.598154, 32.510391),
//       infoWindow: const InfoWindow(
//         title: 'ملاعب الاصلاحية',
//         snippet: 'Athletic field',
//       ),
//     );
//     Marker secondMarker = Marker(
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//       markerId: MarkerId('السودان'),
//       position: LatLng(15.611314, 32.553918),
//       infoWindow: InfoWindow(
//         title: 'ملاعب كوبري كوبر',
//         snippet: 'Athletic field',
//         //n15.614179, 32.567051
//       ),
//     );
//     Marker thirMarker = Marker(
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//       markerId: MarkerId('السودان'),
//       position: LatLng(15.614179, 32.567051),
//       infoWindow: InfoWindow(
//         title: 'ملعب نادي النيل الوطني',
//         snippet: 'Athletic field',
//       ),
//     );
//     Marker fourMarker = Marker(
//       // icon: fromAssetImage(
//       //   ImageConfiguration(devicePixelRatio: 2.5),
//       //   'assets/images/football.png',
//       // ),
//       markerId: MarkerId('السودان'),
//       position: LatLng(15.587967, 32.527682),
//       infoWindow: InfoWindow(
//         title: 'ملعب نادي الاسرة',
//         snippet: 'Athletic field',
//       ),
//     );
//     _markers.add(firstMarker);
//     _markers.add(secondMarker);
//     _markers.add(thirMarker);
//     _markers.add(fourMarker);
//   }

//   void getCurrnetLocation() async {
//     Geolocator.getCurrentPosition().then((Position value) {
//       print(value);

//       _controller.future.then((GoogleMapController controller) {
//         controller.animateCamera(
//           CameraUpdate.newCameraPosition(
//             CameraPosition(
//               target: LatLng(value.latitude, value.longitude),
//               zoom: 15,
//             ),
//           ),
//         );
//       });
//     });
//   }
// }
