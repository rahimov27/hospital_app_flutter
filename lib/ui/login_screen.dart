import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_project/core/app_fonts.dart';
import 'package:hospital_project/ui/check_code_page.dart';

import '../core/common_widgets/app_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final int code = Random().nextInt(8999) + 1000;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          "Вход",
          style: AppFonts.w600s17,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black.withOpacity(0.54),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Войти",
              style: AppFonts.w700s34,
            ),
            const SizedBox(height: 49),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Text("Номер телефона",
                  style: AppFonts.w400s15
                      .copyWith(color: const Color(0xff333333))),
            ),
            const SizedBox(height: 12),
            TextField(
              style: AppFonts.w700s17,
              keyboardType: TextInputType.number,
              controller: controller,
              decoration: const InputDecoration(
                  hintText: "0 ________",
                  hintStyle: AppFonts.w700s17,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
            const SizedBox(height: 33),
            const Text(
                "На указанный вами номер придет однократное СМС-сообщение с кодом подтверждения."),
            const SizedBox(height: 108),
            Spacer(),
            Center(
              child: AppButton(
                title: "Далее",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CheckCodePage(code: code,)));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${code.toString()}\n${controller.text}',
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
