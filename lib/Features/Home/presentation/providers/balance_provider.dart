
import 'package:flutter/material.dart';

class BalanceProvider extends ChangeNotifier {
  double _balance = 193450.0;
  bool _isPrimary = true;

  double get balance => _balance;
  bool get isPrimary => _isPrimary;

  void updateBalance(double amount) {
    _balance += amount;
    notifyListeners();
  }

  void togglePrimary() {
    _isPrimary = !_isPrimary;
    notifyListeners();
  }
}
