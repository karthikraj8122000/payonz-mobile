import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final LocalAuthentication auth;
  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState(() {
          _supportState = isSupported;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentication"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_supportState)
            const Text("This device is supported")
          else
            const Text("Not Supported"),
          Divider(
            height: 100,
          ),
          ElevatedButton(
              onPressed: _getAvailableBioMetric, child: Text("Get BioMetric")),
          const Divider(),
          ElevatedButton(onPressed: _authenticate, child: Text("Authenticate"))
        ],
      ),
    );
  }

  Future<void> _getAvailableBioMetric() async {
    List<BiometricType> availableBioMetrics =
        await auth.getAvailableBiometrics();

    print("List Of Available : $availableBioMetrics");

    if (!mounted) {
      return;
    }
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
          localizedReason: "Authenticated",
          options:
              AuthenticationOptions(stickyAuth: true, biometricOnly: true));

      print("Authenticated : $authenticated");
    } on PlatformException catch (e) {
      print("Error : $e");
    }
  }
}
