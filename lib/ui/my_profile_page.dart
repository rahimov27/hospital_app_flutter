import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_project/core/app_fonts.dart';
import 'package:hospital_project/ui/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('isLogined', false);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SplashScreen(),
              ),
            );
          },
          child: const Text(
            "Exit",
            style: AppFonts.w600s18,
          ),
        ),
      ),
    );
  }
}
