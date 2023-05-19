import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      print("dsadsadsadsa");
      Modular.to.pushReplacementNamed(
          Routes.initial.moduleNavigate(Routes.login.path));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: const Center(
          child: SizedBox(
            height: 20,
            child: Text("Splash screen"),
          ),
        ),
      ),
    );
  }
}
