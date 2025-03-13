import 'package:payonz/Core/theme/app_theme.dart';
import 'package:payonz/Features/Auth/presentation/providers/auth_provider.dart';
import 'package:payonz/Features/Bank/presentation/providers/bank_provider.dart';
import 'package:flutter/material.dart';
import 'package:payonz/Features/Home/presentation/providers/balance_provider.dart';
import 'package:payonz/Features/Home/presentation/providers/contact_provider.dart';
import 'package:payonz/Features/Home/presentation/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

import 'Config/app_routes.dart';
import 'Features/Home/presentation/providers/offers_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => BankProvider()),
        ChangeNotifierProvider(create: (_) => BalanceProvider()),
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
        ChangeNotifierProvider(create: (_) => ContactProvider()),
        ChangeNotifierProvider(create: (_) => OffersProvider())
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'PayOnz',
        theme: AppTheme.lightTheme,
        // home: const SplashScreen(),
      ),
    );
  }
}
