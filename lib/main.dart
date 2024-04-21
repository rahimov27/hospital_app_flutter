import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_project/ui/first_screen.dart';
import 'package:hospital_project/ui/login_screen.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
      theme: ThemeData(
        fontFamily: 'Sf-pro'
      ) ,
    );
  }
}
