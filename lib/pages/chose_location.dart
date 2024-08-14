// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async {
    //similate a network request for a username
    await Future.delayed(Duration(seconds: 3), () {
      print("coule");
    });

    Future.delayed(Duration(seconds: 2), () {
      print("coule mbombo muana mboka");
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
            backgroundColor: Colors.blue[900],
            title: Text("Choose a location"),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0),
            centerTitle: true,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.white,
            )),
        body: Text("Choose location screen"));
  }
}
