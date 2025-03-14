import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payonz/Core/Constants/app_colors.dart';

class ExitAppHandler extends StatefulWidget {
  final Widget child;
  final Duration exitTimeout;
  final String exitMessage;

  const ExitAppHandler({
    Key? key,
    required this.child,
    this.exitTimeout = const Duration(milliseconds: 2000),
    this.exitMessage = 'Press back again to exit',
  }) : super(key: key);

  @override
  State<ExitAppHandler> createState() => _ExitAppHandlerState();
}

class _ExitAppHandlerState extends State<ExitAppHandler> {
  DateTime? _lastBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        if (_lastBackPressTime == null ||
            now.difference(_lastBackPressTime!) > widget.exitTimeout) {
          _lastBackPressTime = now;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              shape: RoundedRectangleBorder(side: BorderSide(color: AppColors.card1)),
              backgroundColor: Colors.white,
              content: Text(widget.exitMessage,style: TextStyle(color: AppColors.card1),),
              duration: widget.exitTimeout,
            ),
          );
          return false;
        }
        SystemNavigator.pop();
        return true;
      },
      child: widget.child,
    );
  }
}
