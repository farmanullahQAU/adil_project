// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Constants/constants.dart';
import 'package:fyp/Screens/add_vechile.dart';
import 'package:fyp/Screens/challen_screen.dart';
import 'package:fyp/Screens/change_password.dart';
import 'package:fyp/Screens/search_screen.dart';
import 'package:fyp/Screens/vechile_details.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[600],
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue[800],
              child: Container(
                margin: EdgeInsets.only(top: 130, right: 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Admin",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(FirebaseAuth.instance.currentUser!.email.toString(),
                        style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.74,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.74,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                    ),
                    child: Align(
                      alignment: Alignment(0.0, 0.0),
                      child: SizedBox(
                        width: 360.0,
                        height: 220.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(36.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // ignore: prefer_const_literals_to_create_immutables
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(3.0, 6.0),
                                    blurRadius: 10.0),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: ListTile(
                                        title: Text(
                                          'Home',
                                          textScaleFactor: 1.2,
                                        ),
                                        trailing: Icon(Icons.home)),
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChangePassword()));
                                    },
                                    child: ListTile(
                                      title: Text(
                                        'Change Password',
                                        textScaleFactor: 1.2,
                                      ),
                                      trailing: Icon(Icons.password),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      authController.signOut();
                                    },
                                    child: ListTile(
                                      title: Text(
                                        'Logout',
                                        textScaleFactor: 1.2,
                                      ),
                                      trailing: Icon(Icons.logout),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        
        title: Text("Admin"),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.cyan),
              margin: EdgeInsets.only(top: 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                        text: TextSpan(
                      text: 'RIFD Treaffic Violation  Dectection',
                      style: TextStyle(color: Colors.yellow, fontSize: 20),
                    )),
                  ),
                  Text("System",
                      style: TextStyle(color: Colors.yellow, fontSize: 20))
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            DottedBorder(
              borderType: BorderType.Circle,
              radius: Radius.circular(60),
              color: Colors.white,
              dashPattern: const [1, 2, 3, 6, 8],
              strokeWidth: 10,
              strokeCap: StrokeCap.butt,
              padding: EdgeInsets.all(1),
              child: CircleAvatar(
                backgroundColor: Colors.cyan[300],
                backgroundImage: ExactAssetImage(
                  'assets/images/logon1.png',
                ),
                radius: 90,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 90,
                    padding: const EdgeInsets.only(top: 30.0),
                    child: ElevatedButton(
                      
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlueAccent, // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {
                          Get.to(VechileDetails());
                        },
                        child: Text(
                          "Search Vechicle ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 140,
                    height: 90,
                    padding: const EdgeInsets.only(top: 30.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlueAccent, // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {
                          Get.to(ChallenScreen());
                        },
                        child: Text(
                          "View Challans",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(left: Radius.zero)),
                  width: 140,
                  height: 90,
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlueAccent, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () async {
                        Get.to(AddVech());
                      },
                      child: Text(
                        "Add Vechile",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 140,
                  height: 90,
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlueAccent, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        Get.to((SerachScreen()));
                      },
                      child: Text(
                        "Serach",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
