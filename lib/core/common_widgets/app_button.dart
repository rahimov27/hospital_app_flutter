import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.78,
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff4A86CC),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
        ),
        onPressed: onPressed,
        child: Text(title,style: AppFonts.w600s18.copyWith(color: Color(0xffFFFFFF)),),
      ),
    );
  }
}
