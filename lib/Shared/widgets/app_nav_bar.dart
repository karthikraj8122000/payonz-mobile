import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payonz/Features/Home/presentation/screens/dashboard.dart';
import 'package:payonz/Features/Profile/presentation/screens/profile.dart';
import 'package:payonz/Features/Transaction/presentation/screens/transaction.dart';

import '../../Core/Constants/app_colors.dart';

class AppNavBar extends StatefulWidget {
  final dynamic child;
  const AppNavBar({
    required this.child,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('AppNavBar'));

  @override
  _AppNavBarState createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onWillPop() async {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;

    return await showDialog(
          context: context,
          builder: (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              width: isTablet ? 300 : MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.exit_to_app_rounded,
                    color: AppColors.mintGreen,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Exit App',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Are you sure you want to exit?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mintGreen,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Exit',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
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
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    print('object ${widget.child}');
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: AppBottomBar(
          opacity: 1.0,
          currentIndex: _calculateSelectedIndex(context),
          onTap: (int? index) => _onTap(context, index ?? 0),
          elevation: 8,
          // hasInk: true,
          items: _navigationItems,
          shape: const CircularNotchedRectangle(), // Added for FAB notch
          notchMargin: 8.0, // Added for FAB spacing
        ),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: AppColors.card1,
          child: const Icon(
            Icons.qr_code_scanner,
            size: 36, // Larger size as requested
          ),
          onPressed: () {
          },
          // onPressed: () => _onTap(context, 4),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  static const _navigationItems = <AppBottomBarItem>[
    AppBottomBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home,color: Colors.white,),
      title: "Home",
    ),
    AppBottomBarItem(
      icon: Icon(Icons.credit_card_outlined),
      activeIcon: Icon(Icons.credit_card,color: Colors.white),
      title: "My Card",
    ),
    AppBottomBarItem(
      icon: Icon(Icons.receipt_long_outlined),
      activeIcon: Icon(Icons.receipt_long,color: Colors.white),
      title: "Activity",
    ),
    AppBottomBarItem(
      icon: Icon(Icons.person),
      activeIcon: Icon(Icons.person,color: Colors.white),
      title: "Profile",
    ),
  ];

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    if (location.startsWith(DashboardPage.routeName)) {
      return 0;
    }
    if (location.startsWith(TransactionsPage.routeName)) {
      return 1;
    }
    if (location.startsWith(DashboardPage.routeName)) {
      return 2;
    }
    if (location.startsWith(ProfilePage.routeName)) {
      return 3;
    }

    return 0;
  }

  void _onTap(BuildContext context, int index) {
    print("_onTap index ${index}");
    switch (index) {
      case 0:
        GoRouter.of(context).go(DashboardPage.routeName);
        break;
      case 1:
        GoRouter.of(context).go(TransactionsPage.routeName);
        break;
      case 2:
        GoRouter.of(context).go(DashboardPage.routeName);
        break;
      case 3:
        GoRouter.of(context).go(ProfilePage.routeName);
        break;
    }
  }
}

// Minimal AppBottomBarItem class (assuming this matches your original)
class AppBottomBarItem {
  final Widget icon;
  final Widget activeIcon;
  final String title;

  const AppBottomBarItem({
    required this.icon,
    required this.activeIcon,
    required this.title,
  });
}

// Example AppBottomBar implementation since original wasn't provided
class AppBottomBar extends StatelessWidget {
  final double opacity;
  final int currentIndex;
  final Function(int?) onTap;
  final double elevation;
  final List<AppBottomBarItem> items;
  final NotchedShape? shape; // Added for notch
  final double notchMargin; // Added for notch spacing

  const AppBottomBar({
    required this.opacity,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.elevation = 8,
    this.shape,
    this.notchMargin = 0.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: elevation,
      shape: shape,
      notchMargin: notchMargin,
      color: AppColors.card1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Left items (Home, My Card)
          for (int i = 0; i < 2; i++) _buildItem(i, items[i]),
          // Space for FAB
          const SizedBox(width: 60),
          // Right items (Activity, Profile)
          for (int i = 2; i < 4; i++) _buildItem(i, items[i]),
        ],
      ),
    );
  }

  Widget _buildItem(int index, AppBottomBarItem item) {
    return InkWell(
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            currentIndex == index ? item.activeIcon : item.icon,
            Expanded(
              child: Text(
                item.title,
                style: TextStyle(
                  fontSize: 12,
                  color:
                      currentIndex == index ? AppColors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
