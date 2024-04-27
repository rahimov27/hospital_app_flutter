import 'package:flutter/material.dart';
import 'package:hospital_project/core/app_fonts.dart';

class DoctorsListPage extends StatefulWidget {
  const DoctorsListPage({super.key});

  @override
  State<DoctorsListPage> createState() => _DoctorsListPageState();
}

class _DoctorsListPageState extends State<DoctorsListPage> {
  final TextEditingController controller = TextEditingController();

  List<String> professions = [
    "Артимологи",
    "Артимо",
    "Артимоло",
    "Арлоги",
    "Атимологи",
  ];

  String selectedDoctor = "Артимологи";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.border_all),
        ],
        title: const Text("Доктора", style: AppFonts.w700s34),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 266,
                  height: 36,
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                        hintText: "Поиск врача"),
                    controller: TextEditingController(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () {
                    controller.text = '';
                    setState(() {});
                  },
                  child: const Text("Очистить"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: professions.length,
                  itemBuilder: (context, index) {
                    return DoctorsChip(
                        Selected: selectedDoctor == professions[index],
                        onSelected: (val) {
                          selectedDoctor = professions[index];
                          setState(() {});
                        },
                        title: professions[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class DoctorsChip extends StatelessWidget {
  const DoctorsChip({
    super.key,
    required this.Selected,
    required this.onSelected,
    required this.title,
  });

  final bool Selected;
  final String title;
  final Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ChoiceChip(
        onSelected: onSelected,
        disabledColor: Colors.green,
        selectedColor: Colors.blue,
        label: Text(
          title,
          style: AppFonts.w600s15.copyWith(color: Colors.black26),
        ),
        selected: Selected,
      ),
    );
  }
}
