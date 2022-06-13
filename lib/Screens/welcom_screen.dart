// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/home_screen.dart';
import 'package:fyp/Screens/iamge_recognizer.dart';

import 'package:fyp/Screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();
  }
}

class _IntroScreen extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.yellow),
      bodyTextStyle: TextStyle(fontSize: 25.0, color: Colors.white),

      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),

      imagePadding: EdgeInsets.all(20), //image padding
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.cyanAccent,
            Colors.cyan,
            Colors.cyanAccent,
            Colors.cyan,
          ],
        ),
      ),
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.cyan,
      //main background of screen
      pages: [
        //set your page view here
        PageViewModel(
          title: "Transpeerancy through",
          body:
              "E-CHALAN ",
          image: introImage('assets/images/logon1.png'),
          decoration: pageDecoration,
        ),

            PageViewModel(
        title: "Quick detection of signal voilation using",
          body:
              "RADIO FREQUENCY IDENTIFICATION",
          image: introImage('assets/images/logon1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Number plate detection using",
          body:
              "CAMERA",
          image: introImage('assets/images/logon1.png'),
          decoration: pageDecoration,
        ),
    

        //add more screen here
      ],

      onDone: () => Get.off(()=>ViewSelectionWidget()), //go to home page on done
      onSkip: () => goHomepage(context), // You can override on skip
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Skip',
        style: const TextStyle(color: Colors.white),
      ),
      next: const Icon(
        Icons.arrow_forward,
        // color: Colors.white,
      ),
      done: const Text(
        'Continue',
        style:
            const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0), //size of dots
        color: Colors.white, //color of dots
        activeSize: Size(22.0, 10.0),
        //activeColor: Colors.white, //color of active dot
        activeShape: RoundedRectangleBorder(
          //shave of active dot
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  void goHomepage(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return HomeScreen();
    }), (Route<dynamic> route) => false);
  }

  Widget introImage(String assetName) {
    return DottedBorder(
      borderType: BorderType.Circle,
      radius: Radius.circular(20),
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
        radius: 90,
      ),
    );
  }
}


class ViewSelectionWidget extends StatelessWidget {
  const ViewSelectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[700],
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

SizedBox(
  width: Get.width*0.4,
  height: 60,
  child:   TextButton(
  
  
  
    onPressed: (){

                 Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }), (Route<dynamic> route) => false);
                

    },
  
    style: TextButton.styleFrom(
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    
  
      side: BorderSide(color: Colors.white),
  
      
  
      primary: Colors.white), child: Text("RIFD"),
  
  ),
),
            
//             SizedBox(
// height: 60,

//           width: Get.width*0.4,

//               child: ElevatedButton.styleFrom(

                
                  
                  
//                   onPressed: (){
//                  Navigator.of(context).pushAndRemoveUntil(
//               MaterialPageRoute(builder: (context) {
//                     return HomeScreen();
//                   }), (Route<dynamic> route) => false);
                
//                 }, child: Text("RIFD")),
//             ),

            SizedBox(width: 10,),
  
SizedBox(
  width: Get.width*0.4,
  height: 60,
  child:   TextButton(
  
  
  
    onPressed: (){
Get.to(()=>ImageRecognizerWidget());

    },
  
    style: TextButton.styleFrom(
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

  
      side: BorderSide(color: Colors.white),
  
      
  
      primary: Colors.white), child: Text("Camera"),
  
  ),
),
   
          ],
        ),
      ),
    );
  }
}