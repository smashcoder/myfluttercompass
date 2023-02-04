import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double? heading = 0;
  // Setting the compass for the app
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.redAccent.shade700,
        centerTitle: true,
        title: const Text(
        'Simple Compass',
          style: TextStyle(
            fontSize: 41,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${heading!.ceil()}°",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26.0,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Padding(
              padding: const EdgeInsets.all(18.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("assets/cadrant.png"),
                Transform.rotate(
                    angle: ((heading ?? 0 ) * (pi / 180) * -1),
                  child: Image.asset(
                    "assets/compass.png",
                    scale: 1.1,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

