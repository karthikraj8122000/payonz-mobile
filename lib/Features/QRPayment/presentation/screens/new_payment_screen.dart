import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Features/QRPayment/presentation/screens/qrscanner.dart';

import '../../../Home/data/models/contact_model.dart';
import 'local_authentication.dart';

class NewPaymentScreen extends StatefulWidget {
  static const String routeName = '/newpayments';
  const NewPaymentScreen({Key? key}) : super(key: key);

  @override
  _NewPaymentScreenState createState() => _NewPaymentScreenState();
}
class _NewPaymentScreenState extends State<NewPaymentScreen> {

  final List contacts = [
    NewContact(
        name: 'Cameron Williamson',
        phone: '(225) 555-0118',
        imageUrl:
            'https://storage.googleapis.com/a1aa/image/XB9TrvYikFgwDHr_vrYPxDMFw4PanFBBCkxfytOUbfw.jpg'),
    NewContact(
        name: 'Savannah Nguyen',
        phone: '(252) 555-0126',
        imageUrl:
            'https://storage.googleapis.com/a1aa/image/kWkMdlnLajnB5VY0y7jrFqC1EpViWE83a2WQWgBGAto.jpg'),
    NewContact(
        name: 'Bessie Cooper',
        phone: '(316) 555-0112',
        imageUrl:
            'https://storage.googleapis.com/a1aa/image/rxpPsHtrPL0asv_3o3RExaPK6U6kN8Gi3WY4rwe6EXI.jpg'),
    NewContact(
        name: 'Wade Warren',
        phone: '(318) 555-0116',
        imageUrl:
            'https://storage.googleapis.com/a1aa/image/cbla4xadJC6F6x6W60-HFE3YWlhQEjIJhHvpda0t1wQ.jpg'),
    NewContact(
        name: 'Darrell Steward',
        phone: '(880) 555-0117',
        imageUrl:
            'https://storage.googleapis.com/a1aa/image/5KKUNvD4OYn0azxVd7FnKxPRsyQqBPSSXptmHAqg2rw.jpg'),
    NewContact(
        name: 'Ronald Richards',
        phone: '(629) 555-0129',
        imageUrl:
            'https://storage.googleapis.com/a1aa/image/9EwyUBETz80yZ8g5N-FFIbBxtmTFn8BdMHCht3Mp0mw.jpg'),
    NewContact(
        name: 'Albert Flores',
        phone: '(907) 555-0185',
        imageUrl:
            'https://storage.googleapis.com/a1aa/image/mbfIrB9Mf2u4ZgWNYKSOd9wbz6bbCr_jeFPzLKVvEbQ.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:
            Text('New Payment', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIconColumn(Icons.qr_code, 'Scan', () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QRScanner()));
                }),
                _buildIconColumn(Icons.account_balance, 'Transfer', () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AuthScreen()));
                }),
                _buildIconColumn(Icons.phone_android, 'Recharge', () {}),
                _buildIconColumn(Icons.receipt, 'Bill Pay', () {}),
                _buildIconColumn(Icons.bolt, 'Electricity', () {}),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('MY CONTACTS',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return _buildContactItem(contacts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconColumn(IconData icon, String label, VoidCallback ontap) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.appPrimary, width: 2),
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.all(8),
            child: Icon(icon, size: 30, color: AppColors.appPrimary),
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildContactItem(NewContact contact) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(contact.imageUrl),
            radius: 24,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(contact.name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(contact.phone, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}

