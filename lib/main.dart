// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:maps/maps.dart';
import 'package:maps/maps3.dart';
import 'package:maps/page2.dart';

void main() {
  runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: maps3()
       );
  }
}


// AIzaSyBa5t0wmMBUIznhE2y8tPPmWUOBCMoxRuc