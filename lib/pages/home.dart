// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    print(data);

    String bgImage = "";
    if (data['isDaytime'])
      bgImage = "day.jpg";
    else
      bgImage = "night.jpg";
    Color? bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40.0),
              TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location,
                      color: Color.fromARGB(255, 236, 236, 62)),
                  label: Text(
                    "Edit location",
                    style: TextStyle(
                        color: Color.fromARGB(255, 193, 233, 15),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: 20.0),
              CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(
                    'assets/${data['flag']}',
                  )),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Color.fromARGB(255, 43, 117, 228)),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                    fontSize: 66.0, color: Color.fromARGB(255, 43, 117, 228)),
              )
            ],
          ),
        ),
      )),
    );
  }
}
