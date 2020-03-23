import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "No Save Chat",
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.lightGreen
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(
      Duration(milliseconds: 1500),
      (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> homePage()));
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Container(
        decoration: BoxDecoration(color: Colors.lightGreen)
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: Image(image: AssetImage("assets/Send-Symbol-icon.png")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 19.0),
                      child: CircularProgressIndicator(),
                    )
              ],)
            )
            )
        ],
      )
    ],
      );
  }
}

Widget homePage(){
  final controller = TextEditingController();
  void open(){
    String api = "https://api.whatsapp.com/send?phone=";
    String url = api + controller.text;
    if (canLaunch(url) != null) {
     launch(url);
  } else {
    throw 'Could not launch $url';
  }
  }

  return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Padding(
        padding: const EdgeInsets.only(top:50.0),
        child: Column(
            children: <Widget>[
              Text("Phone number should be provided with country code, e.g. +91 for India", style: TextStyle(fontSize: 20.0, color: Colors.grey),),
              Center(
                child: TextField(
                  autofocus: true,
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Phone number"
                  ),
                  controller: controller                
                )
              ),
              Center(
                child: FloatingActionButton.extended(
                  onPressed: open,
                  icon: Icon(Icons.send),
                  label: Text("Open")
                ),
              ),
            ],
        ),
    ),
      ),
      ),
  );
}