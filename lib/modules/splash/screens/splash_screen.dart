import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/modules/layout/layout_screen.dart';
import 'package:islami/modules/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "Splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushNamedAndRemoveUntil(
          context, LayoutScreen.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    var providerTheme = Provider.of<MyProvider>(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        providerTheme.myTheme == ThemeMode.dark
            ? "assets/images/splashDark.png"
            : "assets/images/splashLight.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
