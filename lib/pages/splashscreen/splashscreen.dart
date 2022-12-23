import 'package:flutter/material.dart';
import 'package:latihan_firebase/pages/navbar/navbottom_bar.dart';
import 'package:latihan_firebase/pages/onboarding/on_boarding.dart';
import 'package:latihan_firebase/services/sharedpref_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> route() async {
    final pref = SharedServices();
    String? email = await pref.getEmail();
    Future.delayed(const Duration(seconds: 3), () {
      if (email != null) {
        // print(email);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NavBottomBarUser()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  void initState() {
    route();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/logo.png", scale: 2),
      ),
    );
  }
}
