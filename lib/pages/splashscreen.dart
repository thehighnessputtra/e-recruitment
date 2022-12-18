import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/pages/navbottom_bar.dart';
import 'package:latihan_firebase/pages/on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? name;
  String? email;
  String? role;

  getDocID() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!['name'];
          email = snapshot.data()!['email'];
          role = snapshot.data()!['role'];
        });
      }
    });
  }

  @override
  void initState() {
    getDocID();
    Future.delayed(const Duration(seconds: 3), () {
      // print("DETAIL PROFILE = $role, $email, $name");
      // StreamBuilder<User?>(
      //     stream: FirebaseAuth.instance.userChanges(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return const OnboardingScreen();
      //       } else {
      //         return const NavBottomBarUser();
      //       }
      //     });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavBottomBarUser()),
      );
    });
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
