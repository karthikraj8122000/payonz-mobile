import 'package:flutter/material.dart';

import '../../../../Core/Constants/app_colors.dart';

class SelectLanguageScreen extends StatefulWidget {
  static const String routeName = '/select-language';

  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  List<Map<String, String>> languages = [
    {"code": "English", "name": "English",},
    {"code": "हिन्दी", "name": "Hindi",},
    {"code": "বাংলা", "name": "Bengali", },
    {"code": "ગુજરાતી", "name": "Gujarati", },
    {"code": "ಕನ್ನಡ", "name": "Kannada", },
    {"code": "മലയാളം", "name": "Malayalam", },
    {"code": "मराठी", "name": "Marathi", },
    {"code": "தமிழ்", "name": "Tamil", },
    {"code": "తెలుగు", "name": "Telugu", },

  ];

  String selectedLanguage = "English";
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.card1,
        title: Text('Select Language'),
        actions: [
          // More Options Menu (⋮)
          PopupMenuButton<String>(
            onSelected: (value) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Selected: $value")));
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(value: "Help", child: Text("Get Help")),
              PopupMenuItem(value: "feedback", child: Text("Send feedback")),
            ],
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            SizedBox(height: 16),

            // Language List
            Expanded(
              child: ListView(
                children: languages
                    .where((lang) => lang["name"]!.toLowerCase().contains(
                  searchController.text.toLowerCase(),
                ))
                    .map((lang) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Text(lang["code"]!, style: TextStyle(fontSize: 16)),
                    title: Text("(${lang["name"]!})", style: TextStyle(fontSize: 16)),
                    trailing: selectedLanguage == lang["code"]
                        ? Icon(Icons.check_circle, color: AppColors.card1, size: 26) // ✅ Tick icon when selected
                        : Icon(Icons.circle_outlined, color: Colors.grey, size: 24), // ⚪ Default circle icon
                    onTap: () {
                      setState(() {
                        selectedLanguage = lang["code"]!;
                      });
                    },
                  ),
                ))
                    .toList(),
              ),
            ),

            // Continue Button
            // ElevatedButton(
            //   onPressed: () {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(content: Text("Selected: ${selectedLanguage.toUpperCase()}")),
            //     );
            //   },
            //   style: ElevatedButton.styleFrom(
            //     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
            //     backgroundColor: Colors.blue,
            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //   ),
            //   child: Text("Done", style: TextStyle(fontSize: 16)),
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.card1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                padding:
                EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Selected Language is: ${selectedLanguage.toUpperCase()}")),
                        );
                Navigator.pop(context);
              },
              child: Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
