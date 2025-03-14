import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:payonz/Features/Bank/presentation/screens/bank_account_splash.dart';
import 'package:payonz/Features/Home/presentation/screens/dashboard.dart';

class SimSelection extends StatefulWidget {
  static const String routeName = '/sim-selection';
  const SimSelection({super.key});

  @override
  State<SimSelection> createState() => _SimSelectionState();
}

class SimCard {
  final int id;
  final String provider;
  final String number;
  final String type;
  final Color brandColor;

  SimCard({
    required this.id,
    required this.provider,
    required this.number,
    required this.type,
    required this.brandColor,
  });
}

class _SimSelectionState extends State<SimSelection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  final List<SimCard> sims = [
    SimCard(
      id: 1,
      provider: 'Airtel',
      number: '9876543210',
      type: 'Primary',
      brandColor: Colors.red.shade600,
    ),
    SimCard(
      id: 2,
      provider: 'Jio',
      number: '8765432109',
      type: 'Secondary',
      brandColor: Colors.blue.shade600,
    ),
  ];

  SimCard? selectedSim;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void selectSim(SimCard sim) {
    setState(() {
      selectedSim = sim;
    });
    // Add haptic feedback here if desired
  }

  Future<void> continueRegistration() async {
    if (selectedSim != null) {
      setState(() {
        isLoading = true;
      });

      // Simulate network request
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: selectedSim!.brandColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Proceeding with registration using ${selectedSim!.provider} SIM: ${selectedSim!.number}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          duration: const Duration(seconds: 2),
        ),
      );
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => BankAccountsScreen(),
      //     ));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardPage(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Select SIM Card',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.grey.shade100],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'Choose your SIM',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Select the SIM card you want to use for registration',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 30),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: selectedSim != null
                    ? Container(
                  key: const ValueKey('selected-sim-preview'),
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: selectedSim!.brandColor.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                          ),
                          AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              // Check if selectedSim is still not null before accessing its properties
                              if (selectedSim == null) {
                                return const SizedBox.shrink(); // Return an empty widget if null
                              }
                              return Transform.scale(
                                scale: _scaleAnimation.value,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: selectedSim!.brandColor.withOpacity(0.2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectedSim!.brandColor,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedSim!.brandColor.withOpacity(0.3),
                                            blurRadius: 10,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          selectedSim!.provider[0],
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        selectedSim!.provider,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: selectedSim!.brandColor,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        selectedSim!.number,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedSim = null;
                          });
                        },
                        child: Text(
                          'Change selection',
                          style: TextStyle(color: selectedSim!.brandColor),
                        ),
                      ),
                    ],
                  ),
                )
                    : const SizedBox.shrink(),
              ),
              Expanded(
                child: selectedSim == null
                    ? ListView.builder(
                  itemCount: sims.length,
                  itemBuilder: (context, index) {
                    final sim = sims[index];
                    final isSelected = selectedSim?.id == sim.id;

                    return TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.0, end: 1.0),
                      duration: Duration(milliseconds: 500 + (index * 100)),
                      curve: Curves.easeOutQuint,
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(0, 50 * (1 - value)),
                          child: Opacity(
                            opacity: value,
                            child: child,
                          ),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.only(bottom: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: isSelected ? sim.brandColor : Colors.grey.shade300,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        elevation: isSelected ? 4 : 1,
                        shadowColor: isSelected ? sim.brandColor.withOpacity(0.4) : Colors.black12,
                        child: InkWell(
                          onTap: () => selectSim(sim),
                          borderRadius: BorderRadius.circular(16),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: sim.brandColor.withOpacity(0.1),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: sim.brandColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color: sim.brandColor.withOpacity(0.3),
                                                blurRadius: 8,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                            child: Text(
                                              sim.provider[0],
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            sim.provider,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: sim.brandColor,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                            decoration: BoxDecoration(
                                              color: sim.brandColor.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              sim.type,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: sim.brandColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        sim.number,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (isSelected)
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: sim.brandColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
                    : const SizedBox.shrink(),
              ),
              const SizedBox(height: 16),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    if (selectedSim != null)
                      BoxShadow(
                        color: selectedSim!.brandColor.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: selectedSim != null && !isLoading ? continueRegistration : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedSim?.brandColor ?? Colors.grey.shade300,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: isLoading
                      ? SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: Colors.white,
                    ),
                  )
                      : Text(
                    'Continue Registration',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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