// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    final response = await http
        .get(Uri.parse('http://worldtimeapi.org/api/timezone/Europe/Istanbul'));
    Map data = jsonDecode(response.body);
    print(data);

    String datetime = data['datetime'];
    String offset = data['utc_offset'];

    print('$datetime  $offset');
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("loading"));
  }
}
