
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_project/core/app_fonts.dart';
import 'package:hospital_project/core/common_widgets/app_button.dart';
import 'package:hospital_project/ui/create_profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckCodePage extends StatefulWidget {
  const CheckCodePage({super.key, required this.code});

  final int code;

  @override
  State<CheckCodePage> createState() => _CheckCodePageState();
}

class _CheckCodePageState extends State<CheckCodePage> {
  Function()? onPressed;

  TextEditingController controller = TextEditingController();

  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20.66),
          color: const Color(0xff007AFF),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Подтверждение номера",
          style: AppFonts.w600s17,
        ),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
        child: Center(
          child: Column(
            children: [
              Text(
                "Введите код из смс",
                style: AppFonts.w500s22.copyWith(
                  color: const Color(0xff333333),
                ),
              ),
              const SizedBox(
                height: 178,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: controller,
                onChanged: (value) {
                  if (value == widget.code.toString() || value.isEmpty) {
                    if (value == widget.code.toString()) {
                      onPressed = () async {
                        final prefs = await SharedPreferences.getInstance();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateProfileScreen(
                                  prefs: prefs,
                                )));
                      };
                    }
                    setState(() {});
                    errorText = null;
                  } else {
                    onPressed = null;
                    errorText = 'Неверный код';
                    setState(() {});
                  }
                },
                textAlign: TextAlign.center,
                obscureText: true,
                obscuringCharacter: "*",
                maxLength: 4,
                decoration: InputDecoration(
                  errorText: errorText,
                  prefixIcon: const Text(
                    "Код",
                    style: AppFonts.w600s18,
                  ),
                  // hintText: "Код",
                  suffix: InkWell(
                    onTap: () {
                      controller.text = '';
                      errorText = null;
                      setState(() {});
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 17.5,
                      child: Icon(Icons.close),
                    ),
                  ),
                  hintStyle: AppFonts.w600s18.copyWith(
                    color: const Color(0xff333333),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          widget.code.toString(),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Получить код повторно",
                    style: AppFonts.w400s15.copyWith(color: Color(0xff007AFF)),
                  )),
              const Spacer(),
              AppButton(
                title: "Далее",
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}