
import 'package:flutter/material.dart';
import 'package:payonz/Features/Home/data/models/transaction_model.dart';

class TransactionProvider extends ChangeNotifier {
  final List<Transaction> _transactions = [
    Transaction(
      merchantName: 'Amazon Pantry',
      date: '01 Jan',
      description: 'Subscription payment',
      amount: -1200.0,
      logo: 'assets/amazon_logo.png',
    ),
    Transaction(
      merchantName: 'Amazon Pantry',
      date: '01 Jan',
      description: 'Subscription payment',
      amount: -1200.0,
      logo: 'assets/amazon_logo.png',
    ),
    Transaction(
      merchantName: 'Amazon Pantry',
      date: '01 Jan',
      description: 'Subscription payment',
      amount: -1200.0,
      logo: 'assets/amazon_logo.png',
    ),
  ];

  List<Transaction> get transactions => _transactions;

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}