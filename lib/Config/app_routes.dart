import 'package:payonz/Features/Auth/presentation/screens/otp_verification.dart';
import 'package:payonz/Features/Auth/presentation/screens/signin_screen.dart';
import 'package:payonz/Features/Bank/presentation/screens/add_bank_account.dart';
import 'package:payonz/Features/Bank/presentation/screens/bank_account_splash.dart';
import 'package:payonz/Features/CardConfig/presentation/screens/card-config.dart';
import 'package:payonz/Features/Home/presentation/screens/dashboard.dart';
import 'package:payonz/Features/Home/presentation/screens/refer-friends.dart';
import 'package:payonz/Features/Home/presentation/screens/rewards.dart';
import 'package:payonz/Features/Profile/presentation/screens/profile.dart';
import 'package:payonz/Features/QRPayment/presentation/screens/new_payment_screen.dart';
import 'package:payonz/Features/Transaction/presentation/screens/transaction.dart';
import 'package:payonz/Features/Splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Features/Auth/presentation/screens/sim_selection.dart';
import '../Features/Bank/presentation/screens/pay-contacts.dart';
import '../Features/Bank/presentation/screens/pay-phonenumber.dart';
import '../Features/Profile/presentation/screens/language.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _routerKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _mainMenuNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'main-menu');
  static GlobalKey<NavigatorState> get routerKey => _routerKey;

  static final GoRouter _router = GoRouter(
    navigatorKey: _routerKey,
    debugLogDiagnostics: true,
    initialLocation: SplashScreen.routeName,
    observers: [
      GoRouterObserver(),
    ],// Default splash screen
    routes: <RouteBase>[
      GoRoute(
        name: SplashScreen.routeName,
        path: SplashScreen.routeName,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        name: SignInScreen.routeName,
        path: SignInScreen.routeName,
        builder: (_, __) => SignInScreen(),
      ),
      GoRoute(
        name: OtpVerificationScreen.routeName,
        path: OtpVerificationScreen.routeName,
        builder: (_, __) => const OtpVerificationScreen(),
      ),

      GoRoute(
        name: AddBankScreen.routeName,
        path: AddBankScreen.routeName,
        builder: (_, __) => const AddBankScreen(),
      ),
      GoRoute(
        name: DashboardPage.routeName,
        path: DashboardPage.routeName,
        builder: (_, __) => const DashboardPage(),
      ),

      GoRoute(
        name: BankAccountsScreen.routeName,
        path: BankAccountsScreen.routeName,
        builder: (_, __) =>  BankAccountsScreen(),
      ),
      GoRoute(
        name: ProfilePage.routeName,
        path: ProfilePage.routeName,
        builder: (_, __) =>  ProfilePage(),
      ),
      GoRoute(  name: SimSelection.routeName,  path: SimSelection.routeName,  builder: (_, __) => const SimSelection(),),
      GoRoute(
        name: ConfigureCardPage.routeName,
        path: ConfigureCardPage.routeName,
        builder: (_, __) =>  ConfigureCardPage(),
      ),
      GoRoute(
        name: TransactionsPage.routeName,
        path: TransactionsPage.routeName,
        builder: (_, __) =>  TransactionsPage(),
      ),
      GoRoute(
        name: RewardScreen.routeName,
        path: RewardScreen.routeName,
        builder: (_, __) =>  RewardScreen(),
      ),
      GoRoute(
        name: NewPaymentScreen.routeName,
        path: NewPaymentScreen.routeName,
        builder: (_, __) =>  NewPaymentScreen(),
      ),
      GoRoute(
        name: ReferFriends.routeName,
        path: ReferFriends.routeName,
        builder: (_, __) =>  ReferFriends(),
      ),
      GoRoute(
        name: PayContacts.routeName,
        path: PayContacts.routeName,
        builder: (_, __) =>  PayContacts(),
      ),
      GoRoute(
        name: PayPhoneNumber.routeName,
        path: PayPhoneNumber.routeName,
        builder: (_, __) =>  PayPhoneNumber(),
      ),
      GoRoute(
        name: SelectLanguageScreen.routeName,
        path: SelectLanguageScreen.routeName,
        builder: (_, __) =>  SelectLanguageScreen(),
      ),

    ],
  );

  static GoRouter get router => _router;
}


class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('1111');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('2222');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('3333');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    print('4444');
  }
}

