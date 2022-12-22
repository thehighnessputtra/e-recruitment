import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/pages/auth/login_page.dart';
import 'package:latihan_firebase/utils/constant.dart';
import 'package:latihan_firebase/widget/transition_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlueColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 40.0,
          ),
          Image.asset('assets/images/logo.png', scale: 1),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  "Portal Lowongan Kerja Jobfinders",
                  style: size20.copyWith(
                    fontWeight: fw600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 26.0,
                ),
                Text(
                  "Jobfinders merupakan aplikasi mobile yang bertujuan untuk memasarkan lowongan pekerjaan yang telah disediakan oleh PT. KAI!",
                  style: size16.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          navReplaceTransition(context, const LoginPage());
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: blueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(56),
                          ),
                        ),
                        child: Text(
                          'Mulai',
                          style: size16.copyWith(
                              fontWeight: fw600, color: blackColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
