import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../Core/Constants/app_colors.dart';

class PayContacts extends StatefulWidget {
  static const String routeName = '/pay-contacts';
  const PayContacts({super.key});

  @override
  State<PayContacts> createState() => _PayContactsState();
}

class _PayContactsState extends State<PayContacts> {

  TextEditingController searchController = TextEditingController();
  Color randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];

  List<Map<String, dynamic>> recentContacts = [
    {"name": "Payonz Play", "phone": "+91 98765 43210", "icon": Icons.send},
    {"name": "FASTag recharge", "phone": "+91 91234 56789", "icon": Icons.car_crash},
    {"name": "Credit cards", "phone": "+91 91234 56789", "icon": Icons.credit_card},
    {"name": "Postpaid mobile", "phone": "+91 91234 56789", "icon": Icons.phone_android},
  ];

  List<Map<String, dynamic>> allContacts = [
    {"name": "Rahul Verma", "phone": "+91 90123 45678", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGD0BcxwuvdI1H-S35GmT43vP2MBIdCgyeIA&s"},
    {"name": "Sneha Reddy", "phone": "+91 89012 34567", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGD0BcxwuvdI1H-S35GmT43vP2MBIdCgyeIA&s"},
    {"name": "Vikram Singh", "phone": "+91 76543 21098", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGD0BcxwuvdI1H-S35GmT43vP2MBIdCgyeIA&s"},
    {"name": "Meera Joshi", "phone": "+91 67890 12345", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGD0BcxwuvdI1H-S35GmT43vP2MBIdCgyeIA&s"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.card1,
        // title: Text("Pay Contacts"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Selected: $value")));
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(value: "Get Help", child: Text("Get Help")),
              PopupMenuItem(value: "Send feedback", child: Text("Send feedback")),
            ],
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              cursorColor: AppColors.card1,
              decoration: InputDecoration(
                hintText: "Pay anyone on PayONz",
                prefixIcon: Icon(Icons.search),
                // border: OutlineInputBorder(),
                filled: true,
                fillColor: AppColors.card1.withOpacity(0.1),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.transparent), // Define border color
                  borderRadius: BorderRadius.all(
                      Radius.circular(10)), // No border radius
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.card1), // Border color on focus
                  borderRadius: BorderRadius.all(
                      Radius.circular(10)), // No border radius
                ),
              ),
            ),
            SizedBox(height: 16),

            // Recent Contacts
            if (recentContacts.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("Suggested categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            if (recentContacts.isNotEmpty)
              SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: recentContacts.map((contact) {
                    return _buildContactAvatar(contact);
                  }).toList(),
                ),
              ),

            // Recents
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("Recents", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView(
                children: allContacts.map((contact) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.primaries[allContacts.indexOf(contact) % Colors.primaries.length], // Random color
                      backgroundImage: (contact["image"] != null && contact["image"]!.isNotEmpty)
                          ? NetworkImage(contact["image"]!) // Use AssetImage for local assets
                          : null,
                      child: (contact["image"] == null || contact["image"]!.isEmpty)
                          ? Text(
                        contact["name"] != null && contact["name"]!.isNotEmpty
                            ? contact["name"]![0].toUpperCase()
                            : "?", // Fallback
                        style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                      )
                          : null,
                      // No child when image exists
                    ),
                    title: Text(contact["name"]!),
                    subtitle: Text(contact["phone"]!),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Selected: ${contact["name"]}")),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button for New Payment
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //   },
      //   backgroundColor: AppColors.card1,
      //   child: Icon(Icons.qr_code_scanner, size: 28, color: Colors.white),
      // ),
    );
  }

  Widget _buildContactAvatar(Map<String, dynamic> contact) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.card1, // Background color
            child: Icon(
              contact["icon"], // Pass icon dynamically
              size: 20,
              color: Colors.white, // Icon color
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 65, // Ensures text is centered properly
            child: Text(
              contact["name"]!,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center, // Center text
              overflow: TextOverflow.ellipsis, // Handle long names
            ),
          ),
        ],
      ),
    );
  }

}

