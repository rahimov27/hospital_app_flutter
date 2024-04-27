import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_project/core/app_fonts.dart';
import 'package:hospital_project/core/common_widgets/app_button.dart';
import 'package:hospital_project/ui/main_page/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key, required this.prefs});
  final SharedPreferences prefs;

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  String nameText = '';
  final TextEditingController name = TextEditingController();
  final TextEditingController surName = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            size: 24,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Создание профиля",
          style: AppFonts.w600s17,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 31, vertical: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Имя",
              style: AppFonts.w400s17,
            ),
            TextField(
              controller: name,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: "Введите ваше имя",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelStyle: AppFonts.w400s17,
              ),
            ),
            const SizedBox(height: 52),
            const Text(
              "Фамилия",
              style: AppFonts.w400s17,
            ),
            TextField(
              controller: surName,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: "Введите вашу фамилию",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelStyle: AppFonts.w400s17,
              ),
            ),
            Text(
              nameText,
              style: AppFonts.w700s34,
            ),
            const Spacer(),
            Center(
              child: AppButton(
                title: "Далее",
                onPressed: () async {
                  await widget.prefs.setString('name', name.text);
                  await widget.prefs.setString('surname', surName.text);
                  await widget.prefs.setBool('isLogined', true);

                  setState(() {});

                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar(
                    prefs: widget.prefs,
                  )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
