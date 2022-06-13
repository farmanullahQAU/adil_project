import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp/Constants/constants.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class ImageRecognizerWidget extends StatefulWidget {

     ImageRecognizerWidget({Key? key}) : super(key: key);
   
     @override
     State<ImageRecognizerWidget> createState() => _ImageRecognizerWidget();
   }
   
   class _ImageRecognizerWidget extends State<ImageRecognizerWidget> {
     String? processedText;
      XFile? _image;

     final ImagePicker _picker = ImagePicker();
     bool isProcessing=false;

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
           backgroundColor: backgroundColor,
elevation: 0.0,

         ),
         body: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
processedText==null?Container():
             SizedBox(

               width: Get.width*0.7,
               child: Card(
                 
                 child:
//show lading when image is prcessing to recognize text else show the extracted text
                 isProcessing==true?Center(child: CircularProgressIndicator(),):
                 
                 
                  Center(child: Text(processedText??""))),
             ),

//if image picked show the image else show nothing
             _image!=null?Image.file(
               
               
               File(_image!.path),height: 100,width: Get.width,fit: BoxFit.cover,):Container(),
            
       ElevatedButton(
         style: ButtonStyle(backgroundColor: MaterialStateProperty.all(backgroundColor)),
         onPressed: (){



_showDialogue();

       }, child: Text("PICK IMAGE")),
            
       
           ],
         ),
       );
     }

    // Pick an image

    _pickAndProcessImage(ImageSource imageSource)async{


   XFile? _xFile = await _picker.pickImage(source: imageSource);
   //close dialgoue
   Get.back();

if(_xFile!=null)
{
setState(() {
  _image=_xFile;
isProcessing=true;



  
});


final TextRecognizer recognizer= GoogleMlKit.vision.textRecognizer();

 final inputImage=InputImage.fromFilePath(_image!.path);
  final RecognizedText recognizedText=await recognizer.processImage(inputImage);

setState(() {
  isProcessing=false;
  processedText=recognizedText.text;
});
  print("text recognized........");
  print(recognizedText.text);

}

 





    }
    
     Future  _showDialogue() async{

return await Get.defaultDialog(
  middleText: "",
contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 2),

  radius: 5.0,
  title: "Select Image",
  
  
  actions:
  
 
   [

ElevatedButton(
         style: ButtonStyle(backgroundColor: MaterialStateProperty.all(backgroundColor)),
  
  onPressed: (){
  //pick image from gallery and process

  _pickAndProcessImage(ImageSource.gallery);
}, child: Text("Gallary")),
ElevatedButton(
  
         style: ButtonStyle(backgroundColor: MaterialStateProperty.all(backgroundColor)),
  
  onPressed: (){
//take with camera and process
  _pickAndProcessImage(ImageSource.camera);
}, child: Text("Camera")),



],);
      }


   }