import 'package:payonz/Features/Bank/data/models/bank_model.dart';
import 'package:flutter/material.dart';

class BankProvider with ChangeNotifier {
  List<Bank> _banks = [];

  List<Bank> get banks => _banks;

  // Initialize with demo banks
  BankProvider() {
    _banks = [
      Bank(
        id: '1',
        name: 'HDFC Bank',
        accountNumber: '*****3654',
        iconPath: 'assets/icons/hdfc.png',
      ),
      Bank(
        id: '2',
        name: 'Axis Bank',
        accountNumber: '*****0002',
        iconPath: 'assets/icons/axis.png',
      ),
    ];
  }

  void addBank(Bank bank) {
    _banks.add(bank);
    notifyListeners();
  }

  void removeBank(String id) {
    _banks.removeWhere((bank) => bank.id == id);
    notifyListeners();
  }
}