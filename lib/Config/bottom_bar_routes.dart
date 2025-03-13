import 'package:payonz/Features/Home/presentation/screens/dashboard.dart';
import 'package:payonz/Features/Profile/presentation/screens/profile.dart';
import 'package:payonz/Features/Transaction/presentation/screens/transaction.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBottomBarRoutes {
  static final mainMenuRoutes = <RouteBase>[
    GoRoute(
      name: DashboardPage.routeName,
      path: DashboardPage.routeName,
      pageBuilder: (_, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: kThemeAnimationDuration,
          reverseTransitionDuration: kThemeAnimationDuration,
          child: DashboardPage(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      name: TransactionsPage.routeName,
      path: TransactionsPage.routeName,
      pageBuilder: (_, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: kThemeAnimationDuration,
          reverseTransitionDuration: kThemeAnimationDuration,
          child: const TransactionsPage(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),

    GoRoute(
      name: ProfilePage.routeName,
      path: ProfilePage.routeName,
      pageBuilder: (_, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: kThemeAnimationDuration,
          reverseTransitionDuration: kThemeAnimationDuration,
          child: ProfilePage(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
  ].toList(growable: false);
}
