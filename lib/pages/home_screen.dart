// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, deprecated_member_use, unnecessary_null_comparison, avoid_unnecessary_containers, prefer_final_fields, unused_local_variable, override_on_non_overriding_member, avoid_print, unnecessary_string_interpolations, unused_field, depend_on_referenced_packages, sort_child_properties_last

import 'dart:async';

import 'package:course_apps/pages/mydrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Map<String, dynamic>? myUser;

  // final User = FirebaseAuth.instance.currentUser!;

  // Future getUser() async {
  //   final user = await _firestore.collection('users').doc(User.uid).get();
  //   myUser = user.data();
  //   return user.data();

  //   // final user = await _firestore.collection('users').doc(User.uid).get();
  // }

  var currentUser = FirebaseAuth.instance.currentUser;

  List<Marker> _markers = [];

  @override
  Future getPer() async {
    bool services;
    LocationPermission per = await Geolocator.checkPermission();

    if (per == LocationPermission.denied) {
      await Geolocator.requestPermission();
      services = await Geolocator.isLocationServiceEnabled();
      if (services) {
        print('services');
      } else {
        print('services not');
      }
    }
    getCurrnetLocation();
  }

  @override
  void initState() {
    getPer();

    intlize();
    super.initState();
  }

  @override
  intlize() {
    Marker firstMarker = Marker(
      anchor: const Offset(0.5, 0.5),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      markerId: MarkerId('ملاعب الاصلاحية'),
      position: LatLng(15.598154, 32.510391),
      infoWindow: InfoWindow(
        title: 'ملاعب الاصلاحية',
        snippet: 'Athletic field',
      ),
    );
    Marker secondMarker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      markerId: MarkerId('السودان'),
      position: LatLng(15.611314, 32.553918),
      infoWindow: InfoWindow(
        title: 'ملاعب كوبري كوبر',
        snippet: 'Athletic field',
        //n15.614179, 32.567051
      ),
    );
    Marker thirMarker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      markerId: MarkerId('السودان'),
      position: LatLng(15.614179, 32.567051),
      infoWindow: InfoWindow(
        title: 'ملعب نادي النيل الوطني',
        snippet: 'Athletic field',
      ),
    );
    Marker fourMarker = Marker(
      // icon: fromAssetImage(
      //   ImageConfiguration(devicePixelRatio: 2.5),
      //   'assets/images/football.png',
      // ),
      markerId: MarkerId('السودان'),
      position: LatLng(15.587967, 32.527682),
      infoWindow: InfoWindow(
        title: 'ملعب نادي الاسرة',
        snippet: 'Athletic field',
      ),
    );
    _markers.add(firstMarker);
    _markers.add(secondMarker);
    _markers.add(thirMarker);
    _markers.add(fourMarker);
  }

  void getCurrnetLocation() async {
    Geolocator.getCurrentPosition().then((Position value) {
      print(value);

      _controller.future.then((GoogleMapController controller) {
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(value.latitude, value.longitude),
              zoom: 15,
            ),
          ),
        );
      });
    });
  }

  @override
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    //var image = _image;

    Iterable<Polyline> _polylines;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // backgroundColor:Theme.of(context).appBarTheme.backgroundColor ,
          backgroundColor: Colors.green[400],
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.blue[900]),

          title: const Text('Mlaعeb',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),

          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            // Navigate to the Search Screen
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
              icon: Icon(Icons.search),
              tooltip: 'Search for a stadium',
            ),
          ],
        ),
        drawerScrimColor: Colors.grey[900],
        drawer: MyDrawer(),
        body: Stack(
          children: [
            GoogleMap(
              myLocationEnabled: true,
              scrollGesturesEnabled: true,
              markers: _markers.toSet(),
              compassEnabled: true,
              layoutDirection: TextDirection.ltr,
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Positioned(
                top: 115,
                right: 20,
                child: FloatingActionButton(
                  tooltip: 'Press Button to got to  Your Location',
                  hoverColor: Colors.red,
                  splashColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  heroTag: 'btn1',
                  backgroundColor: Colors.green[400],
                  onPressed: () {
                    getCurrnetLocation();
                  },
                  child: Icon(Icons.my_location),
                )),
            DraggableScrollableSheet(
                initialChildSize: 1,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    color: Colors.green[100],
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: const [
                        ListTile(
                          leading: Icon(Icons.stadium),
                          title: Text(' ملعب نادي الاسرة'),
                        ),
                        ListTile(
                          selectedColor: Colors.red,
                          iconColor: Colors.black,
                          leading: Icon(Icons.stadium),
                          title: Text(' ملعب نادي للنيل الوطني'),
                        ),
                      ],
                      addAutomaticKeepAlives: true,
                      controller: scrollController,
                    ),
                  );
                }),
          ],
        ));
  }
}
