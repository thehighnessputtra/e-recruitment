import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/models/job_profile_model.dart';
import 'package:latihan_firebase/pages/home_page/create_job_kai.dart';
import 'package:latihan_firebase/pages/home_page/detail_job_kai.dart';
import 'package:latihan_firebase/pages/home_page/job_card_kai.dart';
import 'package:latihan_firebase/pages/home_page/job_page_kai.dart';
import 'package:latihan_firebase/pages/home_page/testing.dart';
import 'package:latihan_firebase/utils/constant.dart';
import 'package:latihan_firebase/view_model/job_profile_view_model.dart';
import 'package:latihan_firebase/widget/dialog_widget.dart';
import 'package:latihan_firebase/widget/job_profile_card.dart';
import 'package:provider/provider.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   "Jobfinders",
                //   style:
                //       mediumSize.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                // ),
                // Text(
                //   "Merupakan aplikasi e-recruitment yang bertujuan untuk memasarkan perusahaan PT. XXX",
                //   style: mediumSize,
                // ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Job Profile",
                  style: size16.copyWith(fontWeight: fw600),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Consumer<JobProfileViewModel>(
                  builder: (context, value, child) {
                    return SizedBox(
                      height: 120,
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 10.0,
                              ),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final jobProfile = value.getlistJobProfiles[index];
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                JobProfileCard(
                                  jobName: jobProfile.name!,
                                  urlImage: jobProfile.imgUrl == null
                                      ? "https://upload.wikimedia.org/wikipedia/commons/b/b9/Youtube_loading_symbol_1_(wobbly).gif"
                                      : jobProfile.imgUrl!,
                                )
                              ],
                            );
                          },
                          itemCount: listJobProfile.length),
                    );
                  },
                ),

                const SizedBox(
                  height: 15.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateJobKAI()),
                      );
                    },
                    child: const Text("CREATE JOB KAI")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const JobPageKAI()),
                      );
                    },
                    child: const Text("JOB PAGE KAI")),

                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const JobCardKAI()),
                      );
                    },
                    child: const Text("JOB CARD KAI")),
                Text(
                  "News",
                  style: size16.copyWith(fontWeight: fw600),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const TestingAPI(),
                const TestingAPI(),
              ]),
        ),
      ),
    );
  }
}
