import 'package:flutter/material.dart';
import 'package:hospital_project/ui/doctors_page.dart';
import 'package:hospital_project/ui/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const SplashScreen(),
      home: DoctorsListPage(),
      theme: ThemeData(
        fontFamily: 'Sf-pro',
      ),
    );
  }
}
