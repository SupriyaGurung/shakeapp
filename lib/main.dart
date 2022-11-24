import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shake Detection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Shake Your Phone!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List randomImagesList = [
    "assets/coolduck.jpg",
    "assets/erm.jpg",
    "assets/finalboss.jpg",
    "assets/fishes.jpg",
    "assets/hammered.jpg",
    "assets/hummus.jpg",
    "assets/joeBTS.jpg",
    "assets/uno.jpg"
  ];
  Random rnd = Random();
  int _imgIndex = 0;

  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        img();
      });
    });
  }

  void img() {
    int min = 0;
    int max = randomImagesList.length - 1;
    rnd = new Random();
    int r = min + rnd.nextInt(max - min);
    _imgIndex = r;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image(
      image: AssetImage(randomImagesList[_imgIndex]),
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.fill,
    ));
  }
}
