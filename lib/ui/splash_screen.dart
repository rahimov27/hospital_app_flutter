import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_project/ui/first_screen.dart';
import 'package:hospital_project/ui/main_page/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    routing();
    super.initState();
  }

  Widget build(BuildContext context) {
    return const Scaffold();
  }

  void routing() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isLogined') ?? false) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavBar(prefs: prefs),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FirstScreen(),
        ),
      );
    }
  }
}
