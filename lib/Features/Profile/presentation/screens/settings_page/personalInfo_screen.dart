// // Dummy screens for navigation
// import 'package:flutter/material.dart';

// class PersonalInfoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Personal Info')),
//       body: Center(child: Text('Personal Info Screen')),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';

class PersonalInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Personal Info'),
        actions: [
          Icon(Icons.more_vert),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGD0BcxwuvdI1H-S35GmT43vP2MBIdCgyeIA&s',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.appPrimary,
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.phone, color: AppColors.appPrimary),
              title: Text('Mobile number'),
              subtitle: Text('+91 984793 38934'),
              trailing: TextButton(
                onPressed: () {},
                child:
                    Text('Edit', style: TextStyle(color: AppColors.appPrimary)),
              ),
            ),
            Divider(
              color: AppColors.border,
            ),
            ListTile(
              leading: Icon(Icons.email, color: AppColors.appPrimary),
              title: Text('Email'),
              subtitle: Text('example123@gmail.com'),
            ),
          ],
        ),
      ),
    );
  }
}
