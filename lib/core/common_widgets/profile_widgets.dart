import 'package:flutter/material.dart';
import 'package:hospital_project/models/profile_model.dart';

import '../../resources/resources.dart';
import '../app_fonts.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.model

  });

  final ProfileModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          model.image,
          height: 32,
        ),
        const SizedBox(
          width: 18,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.77,
          child: Text(
            model.text,
            style: AppFonts.w400s15,
          ),
        ),
      ],
    );
  }
}