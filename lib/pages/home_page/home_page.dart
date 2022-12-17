import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/models/job_profile_model.dart';
import 'package:latihan_firebase/pages/job_page/job_page.dart';
import 'package:latihan_firebase/services/firebase_storage_services.dart';
import 'package:latihan_firebase/style/theme.dart';
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
    Future.delayed(Duration(seconds: 1), () {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Jobfinders",
            style:
                mediumSize.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Text(
            "Merupakan aplikasi e-recruitment yang bertujuan untuk memasarkan perusahaan PT. XXX",
            style: mediumSize,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "Job Profile",
            style: mediumSize.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Consumer<JobProfileViewModel>(
            builder: (context, value, child) {
              return Flexible(
                flex: 1,
                child: ListView.separated(
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
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10.0,
                        ),
                    itemCount: listJobProfile.length),
              );
            },
          ),
          Text(
            "Recommended Job",
            style: mediumSize.copyWith(fontWeight: FontWeight.w600),
          ),
          Flexible(
            flex: 3,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('listLoker')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ItemLoker(lenght: 5, listLoker: snapshot.data!.docs);
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          )
        ]),
      ),
    );
  }
}
