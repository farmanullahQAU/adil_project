// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EmailPage extends StatefulWidget {
  EmailPage({Key? key}) : super(key: key);

  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[800],
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 50),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 90,
              color: Colors.blue[800],
              child: const Text(
                "RIFD TRAFFIC VIOLATION  DECTECTION SYSTEM",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 23,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 26,
          ),
          Container(
            child: Column(
              children: [
                Container(
                  height: 34,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey[400],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "To:abc@gamil.com",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 270,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Body"),
                        ElevatedButton(onPressed: () {}, child: Text("Send"))
                      ],
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
