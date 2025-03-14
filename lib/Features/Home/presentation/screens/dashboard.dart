import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Features/Home/presentation/widgets/contact_list.dart';
import 'package:payonz/Features/Home/presentation/widgets/quick_actions.dart';
import 'package:payonz/Features/Home/presentation/widgets/wallet_card.dart';
import 'package:payonz/Features/Profile/presentation/screens/profile.dart';
import 'package:payonz/Shared/widgets/exit_app.dart';

import '../../../../Shared/utils/network_connection_error_screen.dart';
import '../../../Transaction/presentation/screens/transaction.dart';
import '../widgets/offers_rewards.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard';
  const DashboardPage({
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('Dashboard'));

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardPage> {

  late StreamSubscription _streamSubscription;
  bool isDeviceConnected = false;
  bool isDialogOpen = false;
  final InternetConnectionChecker _connectionChecker =
  InternetConnectionChecker.createInstance();

  @override
  void initState() {
    checkInternetConnection();
    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
  }

  void checkInternetConnection() {
    _streamSubscription =
        Connectivity().onConnectivityChanged.listen((result) async {
          bool hasConnection = await _connectionChecker.hasConnection;

          if (!hasConnection && !isDialogOpen) {
            var result = await GoRouter.of(context).push(
              NetworkErrorScreen.routeName,
            );
          }
          if (mounted) {
            setState(() {
              isDeviceConnected = hasConnection;
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return ExitAppHandler(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: AppColors.card1,
                      decoration: InputDecoration(
                        hintText: "Pay by name or phone Number ",
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
                  ),
                ],
              ),
            ),
            centerTitle: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: GestureDetector(
                  onTap: () => GoRouter.of(context).push(ProfilePage.routeName),
                  child: CircleAvatar(
                    radius: 20,
                    child: ClipOval(
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGD0BcxwuvdI1H-S35GmT43vP2MBIdCgyeIA&s',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    child: FlipableWalletCard()),
                const SizedBox(height: 24),
                const QuickActions(),
                const SizedBox(height: 20),
                const ContactList(),
                const SizedBox(height: 20),
                OffersAndRewards(),
                _recentTransactionSection(context),
                _inviteSection()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inviteSection() {
    return Stack(
      alignment: Alignment.center,
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.9), // Adjust opacity
            BlendMode.srcATop,
          ),
          child: Image.asset(
            "assets/images/refferels.jpeg",
            width: double.infinity,
            height: 300, // Adjust height as needed
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Invite friends to get ₹201",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            SizedBox(
              width: 350,
              child: Text(
                "Invite friends and earn rewards when they make payments on PayOnz",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                        text: 'Copy your code:',
                        style: TextStyle(color: AppColors.black)),
                    TextSpan(
                        text: '84gd3',
                        style: TextStyle(
                            color: AppColors.card1,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Outlined Invite Button
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.black, width: 1),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
              child: IntrinsicWidth(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Invite",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Icon(
                      Icons.share,
                      color: AppColors.card1,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _recentTransactionSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RECENT TRANSACTIONS',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            // style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              _buildTransactionItem(
                icon: Icons.shopping_bag_outlined,
                color: AppColors.card1.withOpacity(0.5),
                title: 'Shopping',
                date: 'Mar 10, 2025',
                amount: '- ₹1,250.00',
                isDebit: true,
              ),
              _buildTransactionItem(
                icon: Icons.payments_outlined,
                color: AppColors.card1.withOpacity(0.5),
                title: 'Salary',
                date: 'Mar 5, 2025',
                amount: '+ ₹45,000.00',
                isDebit: false,
              ),
              _buildTransactionItem(
                icon: Icons.fastfood_outlined,
                color: AppColors.card1.withOpacity(0.5),
                title: 'Food & Drinks',
                date: 'Mar 3, 2025',
                amount: '- ₹850.00',
                isDebit: true,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: OutlinedButton(
              onPressed: () {
                GoRouter.of(context).push(TransactionsPage.routeName);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.card1, width: 1),
              ),
              child: Text(
                "View All",
                style: TextStyle(color: AppColors.card1, fontSize: 14),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required Color color,
    required String title,
    required String date,
    required String amount,
    required bool isDebit,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: isDebit ? AppColors.mintGreen : AppColors.card2,
            ),
          ),
        ],
      ),
    );
  }

  Widget getBankIcon(String bankName) {
    Color iconColor;
    String iconData;

    switch (bankName) {
      case 'HDFC Bank':
        iconColor = Colors.red;
        iconData = "../assets/images/hdfc.png";
        break;
      case 'Axis Bank':
        iconColor = Colors.purple;
        iconData = "../assets/images/axis.png";
        break;
      case 'Union Bank':
        iconColor = Colors.blue;
        iconData = "../assets/images/hdfc.png";
        break;
      case 'Deutsche Bank':
        iconColor = Colors.indigo;
        iconData = "../assets/images/hdfc.png";
        break;
      default:
        iconColor = Colors.grey;
        iconData = "../assets/images/hdfc.png";
    }

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(iconData, width: 24, height: 24),
    );
  }
}
