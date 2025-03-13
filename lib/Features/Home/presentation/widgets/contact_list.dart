import 'dart:math';
import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Features/Home/presentation/providers/contact_provider.dart';
import 'package:provider/provider.dart';
import '../../../QRPayment/presentation/screens/new_payment_screen.dart';
import '../../../QRPayment/presentation/screens/send_money.dart';
import '../../data/models/contact_model.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactModel = Provider.of<ContactProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'SEND MONEY',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 16),
        LayoutBuilder(builder: (context, constraints) {
          int crossAxisCount = (constraints.maxWidth ~/ 100).clamp(2, 4);
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: constraints.maxWidth / (crossAxisCount * 180),
              crossAxisSpacing: 15,
              mainAxisSpacing: 0,
            ),
            itemCount: contactModel.contacts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildNewContactItem(context);
              }
              return _buildContactItem(context,contactModel.contacts[index - 1]);
            },
          );
        }),
      ],
    );
  }

  Widget _buildNewContactItem(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewPaymentScreen(),
          ),
        );
      },
      child: Container(
        width: 60,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color:AppColors.card1,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'New',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(BuildContext context,Contact contact) {
    Color randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];

    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SendMoney(profilePic: contact.profilePic,name: contact.name,phone: "7810036684",data: '', recipientName: '',fromScreen: 'person',),
          ),
        );
      },
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: randomColor, // Random background color
              backgroundImage: (contact.profilePic != null && contact.profilePic!.isNotEmpty)
                  ? NetworkImage(contact.profilePic!)
                  : null, // Show image if available
              child: (contact.profilePic == null || contact.profilePic!.isEmpty)
                  ? Text(
                contact.name[0].toUpperCase(), // Show first letter
                style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              )
                  : null, // No child when image exists
            ),
            const SizedBox(height: 8),
            Text(
              contact.name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
