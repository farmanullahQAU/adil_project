// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/home_screen.dart';
import 'package:fyp/Screens/login_screen.dart';
import 'package:get/get.dart';

class AddVech extends StatefulWidget {
  AddVech({Key? key}) : super(key: key);

  @override
  _AddVechState createState() => _AddVechState();
}

class _AddVechState extends State<AddVech> {
  final _formKey = GlobalKey<FormState>();

  final modelController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final vechNumController = TextEditingController();
  final tagNoController = TextEditingController();
  DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref('Add vehicle');

  void addData(String name, String address, String model, String email,
      String vehNum, String Tagno) {
    databaseReference.push().set({
      'name': name,
      'status': '1',
      'Model': model,
      'address': address,
      'email': email,
      'vehNum': vehNum,
      'Tagno': Tagno
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("object");
    oer();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    modelController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Vehicle"),
        backgroundColor: Colors.blue[800],
      ),
      backgroundColor: Colors.cyan[600],
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Add Name',
                      hintText: 'Enter Name',
                      labelStyle:
                          TextStyle(fontSize: 16.0, color: Colors.white),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 14),
                    ),
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Add Address',
                      hintText: 'Enter Address',
                      labelStyle:
                          TextStyle(fontSize: 16.0, color: Colors.white),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 14),
                    ),
                    controller: addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Add Model',
                      hintText: 'Enter Model',
                      labelStyle:
                          TextStyle(fontSize: 16.0, color: Colors.white),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 14),
                    ),
                    controller: modelController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Add Email',
                      hintText: 'Enter Email',
                      labelStyle:
                          TextStyle(fontSize: 16.0, color: Colors.white),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 14),
                    ),
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Add Vechile No.',
                      hintText: 'Enter Vechile No.',
                      labelStyle:
                          TextStyle(fontSize: 16.0, color: Colors.white),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 14),
                    ),
                    controller: vechNumController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Add Tag No.',
                      hintText: 'Enter Tag No.',
                      labelStyle:
                          TextStyle(fontSize: 16.0, color: Colors.white),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 14),
                    ),
                    controller: tagNoController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    // Validate returns true if the form is valid, otherwise false.
                    if (_formKey.currentState!.validate()) {
                      addData(
                          nameController.text,
                          addressController.text,
                          modelController.text,
                          emailController.text,
                          vechNumController.text,
                          tagNoController.text);

                      Get.showSnackbar(GetSnackBar(
                        message: 'Add Vechile',
                        duration: Duration(seconds: 2),
                      ));
                      Future.delayed(Duration(seconds: 2))
                          .then((value) => Get.to(HomeScreen()));
                    }
                  },
                  child: Text(
                    'Add Vechile',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  oer() {}
}
