// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fyp/model/user.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

class SerachScreen extends StatefulWidget {
  SerachScreen({Key? key}) : super(key: key);

  @override
  State<SerachScreen> createState() => _SerachScreenState();
}

class _SerachScreenState extends State<SerachScreen> {
  List<UserModel> dataList = [];

  final controller = TextEditingController();
  final String value = '';
  @override
  void initState() {
    super.initState();

    DatabaseReference dbRef =
        FirebaseDatabase.instance.ref().child("Add vehicle");
    dbRef.once().then((snap) {
      List<Map<String, dynamic>> results = [];
      dataList.clear();
      Map<dynamic, dynamic>? data = snap.snapshot.value as Map?;

      data!.forEach((key, value) {
        print('Name:::::::::::' + data[key]['name']);
        UserModel userModel = UserModel(
            model: data[key]['Model'],
            address: data[key]['address'],
            email: data[key]['email'],
            id: data[key]['id'],
            name: data[key]['name'],
            vehNum: data[key]['vehNum']);
        dataList.add(userModel);

        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search "),
        backgroundColor: Colors.blue[800],
      ),
      backgroundColor: Colors.cyan[600],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Enter name or vehicle number',
                      labelStyle:
                          TextStyle(fontSize: 16.0, color: Colors.white),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 14),
                    ),
                    controller: controller,
                    onChanged: (text) {
                      srchethod(text);
                    },
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.77,
                    child: dataList.length == 0
                        ? Card(
                            color: Colors.white,
                            child: Center(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Loading..."),
                              ],
                            )))
                        : Card(
                            color: Colors.white,
                            child: ListView.builder(
                              itemCount: dataList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text('Name: ' + dataList[index].name),
                                  subtitle: Text('vehicle number :' +
                                      dataList[index].vehNum),
                                );
                              },
                            ),
                          ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSerachm({Map? user}) {
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

  void srchethod(String text) {
    DatabaseReference dbRef =
        FirebaseDatabase.instance.ref().child("Add vehicle");
    dbRef.once().then((snap) {
      List<Map<String, dynamic>> results = [];
      dataList.clear();
      Map<dynamic, dynamic>? data = snap.snapshot.value as Map?;

      data!.forEach((key, value) {
        print('Name:::::::::::' + data[key]['name']);
        UserModel userModel = UserModel(
            model: data[key]['Model'],
            address: data[key]['address'],
            email: data[key]['email'],
            id: data[key]['id'],
            name: data[key]['name'],
            vehNum: data[key]['vehNum']);
        if (userModel.name.contains(text) || userModel.vehNum.contains(text)) {
          dataList.add(userModel);
        }
      });
    });
  }
}
