import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payonz/Features/QRPayment/presentation/screens/qrscanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../Core/Constants/app_colors.dart';

class PayonzQrCode extends StatefulWidget {
  // static const String routeName = '/qrCode';

  const PayonzQrCode({super.key});

  @override
  State<PayonzQrCode> createState() => _PayonzQrCodeState();
}

class _PayonzQrCodeState extends State<PayonzQrCode> {
  Color randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.card1,
        // title: Text('QrCode'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.file_download_outlined,),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 8.0),
          //   child: Icon(Icons.more_vert,),
          // ),
          PopupMenuButton<String>(
            onSelected: (value) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Selected: $value")));
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(value: "Set Amount", child: Text("Set Amount")),
              PopupMenuItem(value: "Help", child: Text("Get Help")),
              PopupMenuItem(value: "feedback", child: Text("Send feedback")),
            ],
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: randomColor, // Random background color
                            child:Text(
                              'K', // Show first letter
                              style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text('Karthik Raj',
                            style: const TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      QrImageView(
                        data: 'hello',
                        version: QrVersions.auto,
                        gapless: false,
                        size: 250.0,
                        errorStateBuilder: (cxt, err) {
                          return const Center(
                            child: Text(
                              "Uh oh! Something went wrong...",
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      ),
                      Text('Scan to pay with any UPI app',
                        style: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: OutlinedButton(  onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => QRScanner()));
                    },
                      // style: OutlinedButton.styleFrom(side: BorderSide(color: AppColors.card1, width: 1),  ),
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: AppColors.card1,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                        child: Row(
                          children: [
                            Icon(Icons.qr_code_scanner, color: AppColors.card1,),
                            SizedBox(width: 5,),
                            Text("Open scanner", style: TextStyle(color:  AppColors.card1, fontSize: 14),  ),
                          ],
                        ),
                      ),),
                  ),
                  SizedBox(width: 20,),
                  // Expanded(
                  //   child: OutlinedButton(  onPressed: () {
                  //   },
                  //     style: OutlinedButton.styleFrom(side: BorderSide(color: AppColors.card1, width: 1),  ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                  //       child: Row(
                  //         children: [
                  //           Icon(Icons.share, color: AppColors.card1,),
                  //           SizedBox(width: 5,),
                  //           Text("Share QR code", style: TextStyle(color:  AppColors.card1, fontSize: 14),  ),
                  //         ],
                  //       ),
                  //     ),),
                  // )
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.card1,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                        child: Padding(
                        padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                        child: Row(
                        children: [
                        Icon(Icons.share, color: Colors.white,),
                        SizedBox(width: 5,),
                        Text("Share QR code", style: TextStyle(color: Colors.white, fontSize: 14),  ),
                        ],
                        ),
                        ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),

          
      ),
    );
  }
}
