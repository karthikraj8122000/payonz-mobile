import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Features/QRPayment/presentation/screens/send_money.dart';

class QRScanner extends StatefulWidget {
  static const String routeName = '/qrscanner';

  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner>
    with SingleTickerProviderStateMixin {
  bool _isProcessing = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 200).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScanSuccess(String scannedData) {
    if (_isProcessing) return;
    _isProcessing = true;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SendMoney(data: scannedData, recipientName: '',fromScreen: 'scanner',),
      ),
    ).then((_) => _isProcessing = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              if (barcodes.isNotEmpty) {
                String scannedData = barcodes.first.rawValue ?? "No Data";
                _onScanSuccess(scannedData);
              }
            },
          ),

          // Scanner Box UI
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Scanner Border Box
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.card3, width: 4),
                  ),
                ),

                // Animated Scan Line
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Positioned(
                      top: _animation.value,
                      child: Container(
                        width: 220,
                        height: 4,
                        color: AppColors.appGreen,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Blurred Background
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.8)
                  ],
                  center: Alignment.center,
                  radius: 1.2,
                ),
              ),
            ),
          ),

          // Close Button
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),

          // Instructions
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: const Center(
              child: Text("Align the QR code inside the frame",
                  style: TextStyle(color: Colors.white70, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
