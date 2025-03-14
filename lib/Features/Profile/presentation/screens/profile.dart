import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Features/Bank/presentation/screens/bank_account_splash.dart';
import 'package:payonz/Features/Home/presentation/screens/refer-friends.dart';
import 'package:payonz/Features/Profile/presentation/screens/language.dart';
import 'package:payonz/Features/Profile/presentation/screens/payonz_qr_code.dart';
import 'package:payonz/Features/Profile/presentation/screens/settings_page/settings.dart';
import 'package:payonz/Shared/widgets/apptext.dart';

import '../../../Bank/presentation/screens/bank_accounts.dart';
import '../../../Bank/presentation/screens/my_accounts.dart';
import '../../../Home/presentation/screens/rewards.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 300,
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.white,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: _buildProfileHeader(context),
              ),
            ),
          ];
        },
        body: _buildMainContent(context),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // sliver App Bar container
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF3D5AFE), Color(0xFF1A237E)],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Pofile IMage
            // CircleAvatar(
            //   radius: 50,
            //   backgroundColor: Colors.white,
            //   backgroundImage: NetworkImage(
            //     'https://storage.googleapis.com/a1aa/image/b_YO1Yqna3NsecxruoS1W4u6zSvPTLiFB4Np-BmNfs0.jpg',
            //   ),
            // ),

            Stack(
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
                      backgroundColor: AppColors.white,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PayonzQrCode()));
                        },
                        icon: Icon(
                          Icons.qr_code_scanner,
                          color: AppColors.card1,
                          size: 15,
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(height: 16),
            TitleText(text: 'Karthik', color: Colors.white),
            SizedBox(height: 8),
            CaptionText(text: '+91 98752 98765'),
            SubtitleText(text: 'Karthik@gmailcom@okaxis'),
            SizedBox(height: 16),
            //Reward earned section
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
            //   decoration: BoxDecoration(
            //     color: Colors.white.withOpacity(0.2),
            //     borderRadius: BorderRadius.circular(30),
            //   ),
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Icon(Icons.emoji_events, color: Colors.amber),
            //       SizedBox(width: 8),
            //       SubtitleText(text: '₹20 Rewards earned'),
            //     ],
            //   ),
            // ),
          ],
        ),
      ],
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Row(
          children: [
            Expanded(child: _buildRewardCard(context)),
            SizedBox(
              width: 10,
            ),
            Expanded(child: _buildReferFriendCard(context)),
          ],
        ),
        SizedBox(height: 20),
        _buildSetPaymentMethod(context),
        _buildMenuItem(
            Icons.payments_outlined,
            'Pay with credit or debit cards',
            'Contactless payments, bills, and more', () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyAccounts()));
        }),
        _buildMenuItem(Icons.qr_code, 'Your QR code',
            'Use to receive money from any PayONz app', () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PayonzQrCode()));
        }),
        _buildMenuItem(
            Icons.autorenew, 'Autopay', 'No pending requests', () {}),
        // _buildMenuItem(Icons.business, 'Pay businesses', 'Credit/Debit card',
        //         () {
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (context) => MyAccounts()));
        //     }),
        _buildMenuItem(Icons.settings, 'Settings', '', () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SettingsScreen()));
        }),
        _buildMenuItem(Icons.person_pin, 'Manage PayONz account', '', () {}),
        _buildMenuItem(Icons.question_mark, 'Get help', '', () {}),
        _buildMenuItem(Icons.language, 'Language', 'English', () {
          GoRouter.of(context).push(SelectLanguageScreen.routeName);
        }),
      ],
    );
  }

  Widget _buildMenuItem(
      IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: AppColors.appPrimary),
        title: Text(title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        subtitle: subtitle.isNotEmpty
            ? Text(subtitle, style: TextStyle(color: Colors.grey[600]))
            : null,
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  Widget _buildRewardCard(BuildContext context) {
    return GestureDetector(
      onTap: ()=>GoRouter.of(context).push(RewardScreen.routeName),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
        ),
        // padding: EdgeInsets.all(12),
        child: ListTile(
          leading: Icon(Icons.emoji_events, color: Colors.orange, size: 30),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "₹70",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Rewards earned",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReferFriendCard(BuildContext context) {
    return GestureDetector(
      onTap: ()=>GoRouter.of(context).push(ReferFriends.routeName),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
        ),
        // padding: EdgeInsets.all(12),
        child: ListTile(
          leading: Icon(Icons.group, color: Colors.green, size: 30),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "₹Get 201",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Refer a friend",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSetPaymentMethod(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Navigation Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Set up payment method 1/2",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              ],
            ),
            SizedBox(height: 12),

            // First Payment Option (Bank Account)
            InkWell(
              onTap: () {
                // GoRouter.of(context).push(BankAccountsScreen.routeName);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAccounts()));
              },
              child: Row(
                children: [
                  Icon(Icons.account_balance,
                      color: AppColors.appPrimary, size: 24),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bank account",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "3 accounts",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            // Second Payment Option (Debit/Credit Card)
            InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => DebitCreditCardPage()),
                // );
              },
              child: Row(
                children: [
                  Icon(Icons.credit_card,
                      color: AppColors.appPrimary, size: 24),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Debit/Credit Card",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Visa, MasterCard supported",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
