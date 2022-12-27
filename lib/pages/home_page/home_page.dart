import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/models/job_profile_model.dart';
import 'package:latihan_firebase/pages/home_page/testing.dart';
import 'package:latihan_firebase/utils/constant.dart';
import 'package:latihan_firebase/view_model/job_profile_view_model.dart';
import 'package:latihan_firebase/widget/custom_button.dart';
import 'package:latihan_firebase/widget/dialog_widget.dart';
import 'package:latihan_firebase/widget/job_profile_card.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? name;
  String? email;
  String? role;
  String? cvName;

  @override
  void initState() {
    getDocID();
    validasiCV();
    super.initState();
  }

  Future getDocID() async {
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
          cvName = snapshot.data()!['cvName'];
        });
      }
    });
  }

  validasiCV() {
    Future.delayed(const Duration(seconds: 1), () {
      if (cvName == "Masukan CV anda!") {
        dialogWarning(context,
            "Anda belum melampirkan file CV anda! silahkan anda melampirkan CV anda pada halaman profile");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            name == null ? "Loading" : 'Hi, $name',
          )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    onPress: () async {
                      final Uri url =
                          Uri.parse("https://recruitment.kai.id/news");
                      if (!await launchUrl(url,
                          mode: LaunchMode.externalApplication)) {
                        throw "Could not launch $url";
                      }
                    },
                    text: "PENGUMUMAN SELEKSI",
                  )),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                "Job Profile",
                style: size16.copyWith(fontWeight: fw600),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const TestingAPI(),
            ]),
      ),
    );
  }
}
