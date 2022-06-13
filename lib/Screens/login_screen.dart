// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fyp/Constants/constants.dart';
import 'package:fyp/Screens/iamge_recognizer.dart';
import 'package:fyp/Screens/welcom_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final titleTextStyle=GoogleFonts.actorTextTheme(TextTheme(
headline1: TextStyle(color: Color.fromARGB(255, 8, 100, 175),fontWeight: FontWeight.bold,fontSize: 20)

  ));
  final TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

    
        
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
    
            decoration: BoxDecoration(

              
            image: DecorationImage(
              
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.colorBurn)
            ,  image: AssetImage(
              
                
                'assets/images/pic3.jpeg')),
              
              gradient: LinearGradient(colors: [
    
              Colors.cyan,
              // Colors.cyan.shade700,
              Colors.cyan.shade200
            ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
    
    
                Container(
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(color:Color.fromARGB(255, 76, 73, 245)),
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                    
                      FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                              text: TextSpan(
                            text: 'RIFD Treaffic Violation  Dectection'.toUpperCase(),
                            style: titleTextStyle.headline1,
                          )),
                        ),
                      ),
                      Text("System".toUpperCase(),
                          style: titleTextStyle.headline1)
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                DottedBorder(
                  borderType: BorderType.Circle,
                  radius: Radius.circular(60),
                  color: Colors.blueAccent,
                  dashPattern: [1, 2, 3, 6, 8],
                  strokeWidth: 10,
                  strokeCap: StrokeCap.butt,
                  padding: EdgeInsets.all(1),
                  child: CircleAvatar(
                    backgroundColor: Colors.cyan[300],
                    backgroundImage: ExactAssetImage(
                      'assets/images/logon1.png',
                    ),
                    radius: 60,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          
                          
    style: TextStyle(color: Colors.white),
                        
                          validator: (vaule) {
                            RegExp regex = RegExp(
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?)*$");
                            if (vaule!.isEmpty) {
                              return "* Required";
                            } else if (!regex.hasMatch(vaule) || vaule == null) {
                              return 'Enter a valid email address';
                            } else
                              return null;
                          },
                          controller: _emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.2),
                            
      enabledBorder:  OutlineInputBorder(
        
    
      borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.white, width: 0.0),
      ),
    errorStyle: TextStyle(color: Colors.white),
    
                            border: OutlineInputBorder(
    
    borderRadius: BorderRadius.circular(15)
                              
                            ),
                              hintText: 'Email',
                                                   hintStyle: TextStyle(color: Colors.white54),
    
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                              )),
                        ),
    
                        SizedBox(height: 20,),
                        TextFormField(
                          
    style: TextStyle(color: Colors.white),
    
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "* Required";
                            } else if (value.length < 6) {
                              return "Password should be atleast 6 characters";
                            } else if (value.length > 15) {
                              return "Password should not be greater than 15 characters";
                            } else
                              return null;
                          },
                          controller: _passwordController,
                          obscureText: isHidden,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.2),
                            
    
      enabledBorder:  OutlineInputBorder(
    
      borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.white, width: 0.0),
      ),
    errorStyle: TextStyle(color: Colors.white),
    
                            border: OutlineInputBorder(
    
    borderRadius: BorderRadius.circular(15),
    
    
    
    
                            ),
                              hintText: 'Password',
                            
                              suffixIcon: IconButton(
                                icon: 
                                isHidden?Icon(Icons.visibility_off):
                                
                                Icon(Icons.visibility),
                                onPressed: () {
                                  _togglePasswordView();
                                },
                                color: Colors.white,
                              ),
                              hintStyle: TextStyle(color: Colors.white54),
                              prefixIcon: Icon(
                                Icons.password,
                                color: Colors.white,
                              )),
                        ),
                        Container(
                          width: Get.width*0.9,
                          height: 80,
                          padding: const EdgeInsets.only(top: 30.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.cyan[300], // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () async {
                              // setState(() {
                              //   isLoading = true;
                              // });
                              if (formkey.currentState!.validate()) {
                                authController.login(_emailController.text.trim(),
                                    _passwordController.text.trim());
                                print("Validated");
                              } else {
                                print("Not Validated");
                              }
    
                              // setState(() {
                              //   isLoading = ;
                              // });
                            },
                            child: 
                            
                      Obx(()=>
                         authController.isLoading.isTrue
                                  ? SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: CircularProgressIndicator(
                                        color: Colors.yellow,
                                        strokeWidth: 1.5,
                                      ))
                                  : Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                      ),
                          ),
                        ),
    
                    
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }
}


   