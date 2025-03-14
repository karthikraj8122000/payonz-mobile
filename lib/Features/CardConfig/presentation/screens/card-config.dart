import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Shared/widgets/apptext.dart';
import 'package:payonz/Shared/widgets/appButton.dart';

void main() {
  runApp(MaterialApp(home: ConfigureCardPage()));
}

class ConfigureCardPage extends StatefulWidget {
  static const String routeName = '/card-config';

  const ConfigureCardPage({super.key});
  @override
  _ConfigureCardPageState createState() => _ConfigureCardPageState();
}

class _ConfigureCardPageState extends State<ConfigureCardPage> {
  double maxSpendAmount = 5000;
  bool isNotificationOn = true;
  double walletAlertAmount = 500;
  String refillType = "Manual Fill";
  String autoFillType = "Priority Based"; // Default for Auto Fill
  List<String> banks = ["Axis Bank", "HDFC Bank", "IOB Bank"];
  Map<String, double> bankPercentage = {};
  Map<String, int> bankPriority = {};
  Map<String, double> bankAmount = {};
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // Check if only one bank account is available
    bool hasMultipleBanks = banks.length > 1;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          title: Text(
        "Configure Card Settings",
        style: TextStyle(fontSize: 16),
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Max Spend Amount", style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  TextField(
                    keyboardType: TextInputType.number,
                    cursorColor: AppColors.card1,
                    decoration: InputDecoration(
                      hintText: "Enter max spend amount",
                      prefixText: "₹ ",
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
                    onChanged: (value) {
                      setState(() =>
                          maxSpendAmount = double.tryParse(value) ?? 5000);
                    },
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Notifications", style: TextStyle(fontSize: 14)),
                        Transform.scale(
                          scale: 0.75, // Adjust scale factor as needed
                          child: Switch(
                            value: isNotificationOn,
                            onChanged: (value) =>
                                setState(() => isNotificationOn = value),
                            activeColor: AppColors.card1,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),

                  Text("Wallet Alert Amount", style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  TextField(
                    keyboardType: TextInputType.number,
                    cursorColor: AppColors.card1,
                    decoration: InputDecoration(
                      hintText: "Enter alert amount",
                      // border: OutlineInputBorder(),
                      prefixText: "₹ ",
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
                    onChanged: (value) {
                      setState(() =>
                          walletAlertAmount = double.tryParse(value) ?? 500);
                    },
                  ),
                  SizedBox(height: 24),

                  Text("Wallet Refilling Type", style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),

                  // If only one bank, show checkbox instead of dropdown
                  hasMultipleBanks
                      ? DropdownButtonFormField<String>(
                          value: refillType,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: AppColors.card1.withOpacity(0.1),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .transparent), // Define border color
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)), // No border radius
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      AppColors.card1), // Border color on focus
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)), // No border radius
                            ),
                          ),
                          items: ["Manual Fill", "Auto Fill"]
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (value) => setState(
                              () => refillType = value ?? "Manual Fill"),

                          //Border radious for dropdown
                          borderRadius: BorderRadius.circular(10),
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                title: Text("Manual Fill"),
                                value: "Manual Fill",
                                groupValue: refillType,
                                onChanged: (value) =>
                                    setState(() => refillType = value!),
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                title: Text("Auto Fill"),
                                value: "Auto Fill",
                                groupValue: refillType,
                                onChanged: (value) =>
                                    setState(() => refillType = value!),
                              ),
                            ),
                          ],
                        ),
                  SizedBox(height: 24),

                  if (refillType == "Manual Fill") ...[
                    Text("Select Bank & Enter Amount",
                        style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),
                    ...buildBankAmountFields(),
                  ],

                  if (refillType == "Auto Fill" && hasMultipleBanks) ...[
                    Text("Auto Fill Options", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: autoFillType,
                      decoration: InputDecoration(
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
                      items: ["Priority Based", "Percentage Based"]
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) => setState(
                          () => autoFillType = value ?? "Priority Based"),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    SizedBox(height: 16),
                    if (autoFillType == "Priority Based") ...[
                      Text("Set Priority for Each Bank",
                          style: TextStyle(fontSize: 14)),
                      SizedBox(height: 8),
                      ...buildBankPriorityFields(),
                    ],
                    if (autoFillType == "Percentage Based") ...[
                      Text("Set Percentage for Each Bank",
                          style: TextStyle(fontSize: 14)),
                      Text("Total should equal 100%",
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                      SizedBox(height: 8),
                      ...buildBankPercentageFields(),
                    ],
                  ],

                  SizedBox(height: 32),

                  // Configure Card button
                  AppButton(
                      label: "Configure Card",
                      onPressed: () => configureCard()),
                  // SizedBox(
                  //   width: double.infinity,
                  //   height: 50,
                  //   child:
                  //   ElevatedButton(
                  //     onPressed: () => configureCard(),
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: AppColors.card1,
                  //       foregroundColor: Colors.white,
                  //       minimumSize: const Size(double.infinity, 55),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(50),
                  //       ),
                  //     ),
                  //     child: Text(
                  //       "Configure Card",
                  //       style: TextStyle(fontSize: 14),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 24),
                ],
              ),
            ),

            // Loading overlay
            if (isLoading)
              Container(
                color: Colors.black.withOpacity(0.3),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Helper methods to build bank input fields
  List<Widget> buildBankAmountFields() {
    return banks.map((bank) {
      return Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(bank, style: TextStyle(fontSize: 16)),
              ),
              Expanded(
                flex: 2,
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: AppColors.card1,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.card1)),
                    hintText: "₹ Amount",
                    // border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  onChanged: (value) {
                    setState(() {
                      bankAmount[bank] = double.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  // List<Widget> buildBankPriorityFields() {
  //   return banks.asMap().entries.map((entry) {
  //     int index = entry.key;
  //     String bank = entry.value;

  //     return Card(
  //       key: ValueKey(bank),
  //       margin: EdgeInsets.symmetric(vertical: 8),
  //       child: Padding(
  //         padding: EdgeInsets.all(12),
  //         child: Row(
  //           children: [
  //             Expanded(
  //               flex: 3,
  //               child: Padding(
  //                 padding: const EdgeInsets.only(top: 8, bottom: 8),
  //                 child: TitleText(
  //                     text: "$bank (Priority: ${index + 1})", size: 14),
  //               ),
  //             ),
  //             Icon(Icons.drag_handle, color: Colors.grey), // Drag handle
  //           ],
  //         ),
  //       ),
  //     );
  //   }

  //       // banks.asMap().entries.map((entry) {
  //       //   int index = entry.key;
  //       //   String bank = entry.value;
  //       //   return Card(
  //       //     margin: EdgeInsets.symmetric(vertical: 8),
  //       //     child: Padding(
  //       //       padding: EdgeInsets.all(12),
  //       //       child: Row(
  //       //         children: [
  //       //           Expanded(
  //       //             flex: 3,
  //       //             // child: Text(bank, style: TextStyle(fontSize: 16)),
  //       //             child: Padding(
  //       //               padding: const EdgeInsets.only(top: 8,bottom: 8),
  //       //               child: TitleText(text: bank,size: 14,),
  //       //             ),
  //       //           ),
  //       //           // Expanded(
  //       //           //   flex: 2,
  //       //           //   child: TextField(
  //       //           //     keyboardType: TextInputType.number,
  //       //           //     cursorColor: AppColors.card1,
  //       //           //     decoration: InputDecoration(
  //       //           //       hintText: "Priority (1-${banks.length})",
  //       //           //       // border: OutlineInputBorder(),
  //       //           //       focusedBorder: OutlineInputBorder(
  //       //           //           borderSide: BorderSide(color: AppColors.card1)),
  //       //           //       contentPadding:
  //       //           //           EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //       //           //     ),
  //       //           //     onChanged: (value) {
  //       //           //       setState(() {
  //       //           //         bankPriority[bank] = int.tryParse(value) ?? (index + 1);
  //       //           //       });
  //       //           //     },
  //       //           //   ),
  //       //           // ),
  //       //         ],
  //       //       ),
  //       //     ),
  //       //   );
  //       // }

  //       ).toList();
  // }

  List<Widget> buildBankPriorityFields() {
    return [
      ReorderableListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final bank = banks.removeAt(oldIndex);
            banks.insert(newIndex, bank);
          });
        },
        children: banks.asMap().entries.map((entry) {
          int index = entry.key;
          String bank = entry.value;

          return Padding(
            key: ValueKey(bank), // Unique key moved here
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent, // Transparent background
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TitleText(
                        text: "$bank (Priority: ${index + 1})",
                        size: 14,
                        color: Colors.black, // Adjust color if needed
                      ),
                    ),
                    Icon(
                      Icons.drag_indicator, // Cleaner drag handle icon
                      color: Colors.grey[600], // Slightly darker for visibility
                      size: 24, // Slightly larger for better interaction
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ];
  }

  List<Widget> buildBankPercentageFields() {
    return banks.map((bank) {
      return Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(bank, style: TextStyle(fontSize: 16)),
              ),
              Expanded(
                flex: 2,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.card1)),
                    hintText: "% Value",
                    // border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    suffixText: "%",
                  ),
                  onChanged: (value) {
                    setState(() {
                      bankPercentage[bank] = double.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  // Method to handle card configuration
  void configureCard() {
    setState(() {
      isLoading = true;
    });

    // Simulate API call or processing
    Future.delayed(Duration(seconds: 2), () {
      // Validate inputs here if needed

      // Show success dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Success"),
          content: Text("Your card has been configured successfully!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate back or to another screen if needed
              },
              child: Text("OK"),
            ),
          ],
        ),
      );

      setState(() {
        isLoading = false;
      });
    });
  }
}
