import 'package:flutter/material.dart';
import 'package:learn_api/view/home_1.dart';
import 'package:learn_api/view/home_four.dart';
import 'package:learn_api/view/home_screen2.dart';
import 'package:learn_api/view/home_three.dart';
import 'package:learn_api/view/home_two.dart';

import 'view/dio_getapi.dart';
import 'view/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeFour(),
    );
  }
}
