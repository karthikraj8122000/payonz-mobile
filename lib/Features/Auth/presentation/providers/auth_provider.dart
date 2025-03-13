import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String _phoneNumber = '';
  String _otpCode = '';

  bool get isAuthenticated => _isAuthenticated;
  String get phoneNumber => _phoneNumber;

  void setPhoneNumber(String number) {
    _phoneNumber = number;
    notifyListeners();
  }

  void setOtpCode(String code) {
    _otpCode = code;
    notifyListeners();
  }

  Future<bool> verifyPhoneNumber() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<bool> verifyOtp() async {
    await Future.delayed(const Duration(seconds: 2));
    _isAuthenticated = true;
    notifyListeners();
    return true;
  }

  void signOut() {
    _isAuthenticated = false;
    _phoneNumber = '';
    _otpCode = '';
    notifyListeners();
  }
}