// ignore_for_file: unused_local_variable, use_build_context_synchronously, duplicate_ignore

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/pages/home_page/create_job_kai.dart';
import 'package:latihan_firebase/pages/profile_page/edit_profile_page.dart';
import 'package:latihan_firebase/services/firebase_service.dart';
import 'package:latihan_firebase/widget/custom_button.dart';
import 'package:latihan_firebase/widget/data_administrasi_widget.dart';
import 'package:latihan_firebase/widget/dialog_widget.dart';
import 'package:latihan_firebase/widget/transition_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List docsID = [];

  String? name;
  String? email;
  String? role;
  String? cvName;
  String? ktpName;
  String? ktpURL;
  String? ijazahName;
  String? ijazahURL;
  String? toeflName;
  String? toeflURL;
  String? transNilaiName;
  String? transNilaiURL;
  String? cvURL;
  String? about;
  String? avatarUrl;
  String? avatarName;
  String? biography;
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
          ktpName = snapshot.data()!['ktpName'];
          ktpURL = snapshot.data()!['ktpURL'];
          ijazahName = snapshot.data()!['ijazahName'];
          ijazahURL = snapshot.data()!['ijazahURL'];
          toeflName = snapshot.data()!['toeflName'];
          toeflURL = snapshot.data()!['toeflURL'];
          transNilaiName = snapshot.data()!['transNilaiName'];
          transNilaiURL = snapshot.data()!['transNilaiURL'];
          cvName = snapshot.data()!['cvName'];
          cvURL = snapshot.data()!['cvURL'];
          about = snapshot.data()!['about'];
          avatarUrl = snapshot.data()!['avatarUrl'];
        });
      }
    });
  }

  @override
  void initState() {
    getDocID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          actions: [
            IconButton(
                onPressed: () {
                  dialogValidasi(
                    context,
                    "Are you sure?",
                    () {
                      final firebase = FirebaseService(FirebaseAuth.instance);

                      navBackTransition(context);
                      firebase.signOut(context);
                    },
                  );
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    ClipOval(
                        child: Material(
                            child: Ink.image(
                      image: NetworkImage(avatarUrl == null
                          ? "https://upload.wikimedia.org/wikipedia/commons/b/b9/Youtube_loading_symbol_1_(wobbly).gif"
                          : "$avatarUrl"),
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    ))),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  name == null ? "Loading" : "$name",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Center(
                child: Text(
                  email == null ? "Loading" : "$email",
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                  child: CustomButton(
                text: "Edit Profile",
                onPress: () => navPushTransition(context, const EditProfile()),
              )),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Biografi",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      about == null ? "Loading" : "$about",
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 17, height: 1.3),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DataAdministrasi(
                      namaAdminstrasi: "Curriculum Vitae",
                      fileAdministrasi: cvName != null ? cvName! : "kosong",
                    ),
                    DataAdministrasi(
                        namaAdminstrasi: "Identitas KTP",
                        fileAdministrasi:
                            ktpName != null ? ktpName! : "kosong"),
                    DataAdministrasi(
                        namaAdminstrasi: "Ijazah SLTA/D3/S1",
                        fileAdministrasi:
                            ijazahName != null ? ijazahName! : "kosong"),
                    DataAdministrasi(
                        namaAdminstrasi: "Sertifikat TOEFL",
                        fileAdministrasi:
                            toeflName != null ? toeflName! : "kosong"),
                    DataAdministrasi(
                        namaAdminstrasi: "Transkrip Nilai SLTA/D3/S1",
                        fileAdministrasi: transNilaiName != null
                            ? transNilaiName!
                            : "kosong"),
                    role == 'Admin' ? adminControllerProfile() : Container()
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget adminControllerProfile() {
    return Center(
      child: Column(
        children: [
          const Text("Admin Controller",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: "Create Lowongan Kerja",
                onPress: () => addJob(),
              ),
              CustomButton(
                onPress: () => uploadImage(),
                text: "Upload Image",
              )
            ],
          ),
        ],
      ),
    );
  }

  addJob() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.email)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "Admin") {
          navPushTransition(context, const CreateJobKAI());
        }
      } else {
        // print('Document does not exist on the database');
      }
    });
  }

  uploadImage() async {
    dialogInfo(context, "Avatar sukses diupload!", 2);
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);
    if (result != null) {
      final path = result.files.single.path!;
      final fileName = result.files.single.name;

      FirebaseStorage storage = FirebaseStorage.instance;
      await storage.ref('img/$fileName').putFile(File(path));
      String getDownloadUrl =
          await storage.ref('img/$fileName').getDownloadURL();
      // print("DOWNLOAD AVATAR = $getDownloadUrl");
      // var user = FirebaseAuth.instance.currentUser;
      // CollectionReference ref = FirebaseFirestore.instance.collection('users');
      // ref.doc(user!.email).update({
      //   'avatarName': cvName,
      //   'avatarPath': "cv/$email/$fileName",
      //   'avatarUrl': getDownloadUrl
      // });

      // ignore: use_build_context_synchronously
      dialogInfo(context, "Avatar sukses diupload!", 2);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("File Selected")));
    } else {
      dialogInfo(context, "Avatar gagal diupload!", 2);
    }
  }
}
