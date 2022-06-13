// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/challen_screen.dart';
import 'package:fyp/model/user.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:firebase_database/firebase_database.dart';

class VechileDetails extends StatefulWidget {
  VechileDetails({Key? key}) : super(key: key);

  @override
  _VechileDetailsState createState() => _VechileDetailsState();
}

class _VechileDetailsState extends State<VechileDetails> {
  bool selected = false;
  List<UserModel> dataList = [];
  DatabaseReference databaseRefernce =
      FirebaseDatabase.instance.ref().child('Users');
  Query pendingdbRef = FirebaseDatabase.instance
      .ref()
      .child("Users")
      .orderByChild('status')
      .equalTo('1');

  @override
  void initState() {
    if (kDebugMode) {
      print("object");
    }
    Query pendingdbRef = FirebaseDatabase.instance
        .ref()
        .child("Users")
        .orderByChild('status')
        .equalTo('1');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehilce Details"),
        backgroundColor: Colors.blue[800],
      ),
      backgroundColor: Colors.cyan[600],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 16.0),
            //   child: OutlineSearchBar(
            //     onKeywordChanged: (text) {
            //       serachMethod(text);
            //     },
            //     onTap: () {},
            //     borderWidth: 1,
            //     borderRadius: BorderRadius.circular(15),
            //     hideSearchButton: true,
            //     hintText: 'Vehilce Number',
            //     clearButtonColor: Colors.black,
            //     icon: Icon(
            //       Icons.search,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 25,
            ),
            Card(
              child: SizedBox(
                width: 340,
                height: 400,
                child: ContainedTabBarView(
                  tabs: [
                    const Text('USER'),
                    const Text('VEHICLE'),
                    const Text('PENDING'),
                  ],
                  tabBarProperties: TabBarProperties(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 8.0,
                    ),
                    indicator: ContainerTabIndicator(
                      radius: BorderRadius.circular(1.0),
                      color: Colors.blue,
                      borderWidth: 1.0,
                      borderColor: Colors.transparent,
                    ),
                    labelColor: Colors.yellow[600],
                    unselectedLabelColor: Colors.black,
                  ),
                  views: [
                    SizedBox(
                      width: 330,
                      height: 400,
                      child: Card(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FirebaseAnimatedList(
                              defaultChild:
                                  Center(child: CircularProgressIndicator()),
                              query: databaseReference,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder:
                                  (context, snapshot, animation, index) {
                                Map? user = snapshot.value as Map?;
                                if (user!.isEmpty) {
                                  return Center(
                                    child: Text("Not Data"),
                                  );
                                } else {
                                  return _buildUserItem(user: user);
                                }
                              },
                            )),
                      ),
                    ),
                    Container(
                      width: 330,
                      height: 400,
                      child: Card(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FirebaseAnimatedList(
                              defaultChild:
                                  Center(child: CircularProgressIndicator()),
                              query: databaseReference,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder:
                                  (context, snapshot, animation, index) {
                                Map? user = snapshot.value as Map?;
                                return _buildVechileItem(user: user);
                              },
                            )),
                      ),
                    ),
                    Container(
                      width: 330,
                      height: 400,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FirebaseAnimatedList(
                            defaultChild:
                                Center(child: CircularProgressIndicator()),
                            query: pendingdbRef,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, snapshot, animation, index) {
                              Map? user = snapshot.value as Map?;
                              return _buildVechileItem(user: user);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                  onChange: (index) => print(index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserItem({Map? user}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.2,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                  ),
                  Text(
                    user!['name'],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text("Email"),
                  Text(
                    user['email'],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text("Address"),
                  Text(
                    user['address'],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVechileItem({Map? user}) {
    assert(user != null);
    // Color typeColor = getTypeColor(user['type']);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.2,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Model',
                  ),
                  Text(
                    user!['Model'],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text("vehicle Number"),
                  Text(
                    user['vehNum'],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text("Address"),
                  Text(
                    user['address'],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void serachMethod(String text) async {
    DatabaseReference serachref =
        FirebaseDatabase.instance.ref().child('Users');
    databaseReference.once().then((value) {
      dataList.clear();
      final d = value.snapshot.value as Map;

      dataList.forEach((element) {
        UserModel userModel = UserModel(
            model: element.model,
            address: element.address,
            email: element.email,
            id: element.id,
            name: element.name,
            vehNum: element.vehNum);
        if (userModel.name.contains(text) || userModel.name.contains(text)) {
          dataList.add(userModel);
        }
      });
    });
  }
}
