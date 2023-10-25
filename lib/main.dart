import 'package:flutter/material.dart';
// import 'package:/Pages/HomePage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'Pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  // Fixed the typo: StatefullWidget to StatefulWidget
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Added the _MyAppState class
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}