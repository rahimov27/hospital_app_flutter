import 'package:flutter/material.dart';
import 'package:hospital_project/core/app_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key, required this.name, required this.surname});

  final String name;
  final String surname;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  XFile? img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
              size: 24,
            ),
          ),
        ],
        title: const Text(
          "Мой профиль",
          style: AppFonts.w700s34,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Text(
                    "${widget.name[0]} ${widget.surname[0]}",
                    style: AppFonts.w500s22,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.green,
                    child: IconButton(
                        onPressed: () {
                          pickImage();
                        },
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 16,
                        )),
                  ),
                ),
              ],
            ),
            Text(
              "Айзан Алишерова",
              style: AppFonts.w500s22.copyWith(
                color: Color(0xff333333),
              ),
            ),
            Text(
              "+996 555 78 65 65",
              style: AppFonts.w400s18.copyWith(
                color: Color(0xff333333),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final image = ImagePicker().pickImage(source: ImageSource.gallery);
    img = await image;
    setState(() {});
  }
}
