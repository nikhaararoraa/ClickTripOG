import 'dart:async';

import 'package:clicktrip/allScreens/book_list.dart';
import 'package:clicktrip/allScreens/loginpage.dart';
import 'package:clicktrip/allScreens/mainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final Completer<GoogleMapController> _controllerGoogleMap =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white.withOpacity(0.7),
        //   iconTheme: IconThemeData(color: Colors.black),
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           _auth.signOut().then((value) {
        //             Navigator.pushReplacement(context,
        //                 MaterialPageRoute(builder: (context) => loginScreen()));
        //           });
        //         },
        //         icon: Icon(Icons.exit_to_app))
        //   ],
        // ),
        drawer: Drawer(
          child: ListView(
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 190, 106, 106),
                ), //BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 190, 106, 106)),
                  accountName: Text(
                    "Manvi Tandon",
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text("ManviTandon@gmail.com"),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 126, 64, 64),
                    child: Text(
                      "A",
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ), //Text
                  ), //circleAvatar
                ), //UserAccountDrawerHeader
              ),
              //DrawerHeader
            ],
          ),
        ),
        body: Stack(
          children: [
            const GoogleMap(
              //mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.9),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.gps_fixed,
                            color: Color(0xff656E75),
                          ),
                        )),
                  )
                ],
              ),
              Container(
                height: size.height / 3.5,
                width: size.width,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 7, spreadRadius: 1, color: Colors.grey)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(23),
                        topRight: Radius.circular(23))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BookList()));
                        },
                        child: button(size, "Cab")),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BookList()));
                        },
                        child: button(size, "Bus")),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen()));
                        },
                        child: button(size, "Parking")),
                  ],
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(builder: (context) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.9),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage("lib/images/profile.jpeg"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: size.height / 10.5,
                      width: size.width / 1.35,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 7,
                                spreadRadius: 1,
                                color: Colors.grey.withOpacity(0.5))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.search),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Enter destination",
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xff656E75)))
                        ],
                      ),
                    )
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget button(Size size, String identity) {
    return Container(
      height: size.height / 7,
      width: size.width / 4,
      decoration: BoxDecoration(
          // gradient: const LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Color.fromARGB(255, 224, 138, 138),
          //     Color.fromARGB(255, 134, 59, 54),
          //   ],
          // ),
          color: const Color(0xffEBECF0),
          borderRadius: BorderRadius.circular(18)),
      child: Center(
        child: Text(
          identity,
          style: const TextStyle(
              fontSize: 20,
              color: Color(0xff656E75),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
