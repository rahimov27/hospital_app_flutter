import 'package:flutter/material.dart';
import 'package:hospital_project/core/app_fonts.dart';
import 'package:hospital_project/ui/main_page/profile_page.dart';
import 'package:hospital_project/ui/my_profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/resources.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.prefs});

  final SharedPreferences prefs;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [
      ProfilePage(
        name: widget.prefs.getString('name') ?? '',
        surname: widget.prefs.getString('surname') ?? '',
      ),
      MyWidget(index: 1),
      MyWidget(index: 2),
      MyProfile(),
    ];
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Страница в разработке"),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          );
        },
        child: Container(
          height: 64,
          width: 64,
          decoration: const BoxDecoration(
            color: Color(0xff4A86CC),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Images.ambulance, height: 32),
              Text(
                "Вызов",
                style: AppFonts.w500s10.copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        unselectedItemColor: const Color(0xffA3A3A3),
        selectedItemColor: const Color(0xff4A86CC),
        selectedLabelStyle: AppFonts.w500s10.copyWith(
          color: const Color(0xff4A86CC),
        ),
        unselectedLabelStyle: AppFonts.w500s10.copyWith(
          color: const Color(0xff777777),
        ),
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.person_add_alt_1),
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.list_alt),
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.car_crash),
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          index.toString(),
          style: AppFonts.w700s34,
        ),
      ),
    );
  }
}
