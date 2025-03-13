import 'package:payonz/Features/Bank/presentation/screens/bank_account_splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../Core/theme/app_theme.dart';
import '../providers/auth_provider.dart';
import 'dart:async';

class OtpVerificationScreen extends StatefulWidget {
  static const String routeName = '/otp';
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
        (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    6,
        (_) => FocusNode(),
  );

  int _timerSeconds = 60;
  Timer? _timer;
  bool _isVerifying = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerSeconds > 0) {
        setState(() {
          _timerSeconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  void _verifyOtp() async {
    final otpCode = _controllers.map((c) => c.text).join();

    if (otpCode.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter all 6 digits')),
      );
      return;
    }

    setState(() {
      _isVerifying = true;
    });

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.setOtpCode(otpCode);

    final result = await authProvider.verifyOtp();

    if (result && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const BankAccountsScreen()),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
      setState(() {
        _isVerifying = false;
      });
    }
  }

  void _resendOtp() {
    setState(() {
      _timerSeconds = 60;
    });
    _startTimer();

    // In a real app, you'd call your API to resend OTP
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('OTP resent successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final phoneNumber = Provider.of<AuthProvider>(context).phoneNumber;
    final maskedPhone = phoneNumber.isEmpty
        ? 'your mobile'
        : '+${phoneNumber.substring(0, 3)}******${phoneNumber.substring(phoneNumber.length - 2)}';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Verification',
          style: TextStyle(color: AppTheme.textColor),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.textColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$_timerSeconds Seconds',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Please enter the OTP sent on $maskedPhone',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Verification Code',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                      (index) => SizedBox(
                    width: 45,
                    height: 45,
                    child: TextFormField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 5) {
                          _focusNodes[index + 1].requestFocus();
                        }
                        // Auto verify when all fields are filled
                        if (index == 5 && value.isNotEmpty) {
                          _verifyOtp();
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _isVerifying
                  ? const Center(child: CircularProgressIndicator(color: AppTheme.primaryColor))
                  : ElevatedButton(
                onPressed: _verifyOtp,
                child: const Text('Verify'),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive code? ",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: _timerSeconds > 0 ? null : _resendOtp,
                    child: Text(
                      'Resend',
                      style: TextStyle(
                        color: _timerSeconds > 0
                            ? Colors.grey
                            : AppTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              // Show a circular progress indicator for timer
              if (_timerSeconds > 0)
                Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Stack(
                      children: [
                        Center(
                          child: SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(
                              value: _timerSeconds / 60,
                              strokeWidth: 3,
                              backgroundColor: Colors.grey.withOpacity(0.2),
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}