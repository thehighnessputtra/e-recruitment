// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';
import 'package:latihan_firebase/widget/custom_button.dart';
import 'package:latihan_firebase/widget/dialog_widget.dart';
import 'package:latihan_firebase/widget/edit_administrasi_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
    TextEditingController aboutController = TextEditingController(text: about);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Profile"),
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
                    Positioned(
                        bottom: 0,
                        right: 4,
                        child: InkWell(
                          onTap: () async {
                            uploadImage();
                          },
                          child: ClipOval(
                              child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.blueAccent,
                                      shape: BoxShape.circle,
                                      border: Border.fromBorderSide(BorderSide(
                                          width: 2.5, color: Colors.white))),
                                  padding: const EdgeInsets.all(8),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: Colors.white,
                                  ))),
                        ))
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
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EditAdministrasiWidget(
                      fileAdministrasi: cvName != null ? cvName! : "kosong",
                      namaAdministrasi: "Curriculum Vitae",
                      onPress: () => uploadCV(),
                    ),
                    EditAdministrasiWidget(
                      fileAdministrasi: ktpName != null ? ktpName! : "kosong",
                      namaAdministrasi: "Identitas KTP",
                      onPress: () => uploadKTP(),
                    ),
                    EditAdministrasiWidget(
                      fileAdministrasi:
                          ijazahName != null ? ijazahName! : "kosong",
                      namaAdministrasi: "Ijazah SLTA/D3/S1",
                      onPress: () => uploadIjazah(),
                    ),
                    EditAdministrasiWidget(
                      fileAdministrasi:
                          toeflName != null ? toeflName! : "kosong",
                      namaAdministrasi: "Sertifikat TOELF",
                      onPress: () => uploadTOEFL(),
                    ),
                    EditAdministrasiWidget(
                      fileAdministrasi:
                          transNilaiName != null ? transNilaiName! : "kosong",
                      namaAdministrasi: "Transkrip Nilai SLTA/D3/S1",
                      onPress: () => uploadTransNilai(),
                    ),
                    const Text(
                      "Biografi",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: aboutController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: colorBlueSecondKAI)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: colorBlueSecondKAI)),
                      ),
                      maxLines: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                            text: "Download CV",
                            onPress: () async {
                              if (cvURL != null) {
                                final Uri url = Uri.parse(cvURL!);
                                if (!await launchUrl(url,
                                    mode: LaunchMode.externalApplication)) {
                                  throw "Could not launch $url";
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Could not launch URL!")));
                              }
                            }),
                        CustomButton(
                          onPress: () => uploadCV(),
                          text: "Upload CV",
                        ),
                        CustomButton(
                          onPress: () {
                            setState(() {
                              biography = aboutController.text;
                            });
                            dialogValidasi(context, "Are you sure?", () {
                              Navigator.pop(context);
                              uploadAllFile();

                              dialogInfo(
                                  context, "Success change profiles!", 2);
                              Future.delayed(const Duration(seconds: 2), () {
                                Navigator.pop(context);
                              });
                            });
                          },
                          text: "Simpan",
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  uploadImage() async {
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (result != null) {
      final path = result.files.single.path!;
      final fileName = result.files.single.name;

      FirebaseStorage storage = FirebaseStorage.instance;
      await storage.ref('users/$email/avatar/$fileName').putFile(File(path));
      String getDownloadUrl =
          await storage.ref('users/$email/avatar/$fileName').getDownloadURL();
      // print("DOWNLOAD AVATAR = $getDownloadUrl");
      setState(() {
        avatarName = fileName;
        avatarUrl = getDownloadUrl;
      });
      // var user = FirebaseAuth.instance.currentUser;
      // CollectionReference ref = FirebaseFirestore.instance.collection('users');
      // ref.doc(user!.email).update({
      //   'avatarName': cvName,
      //   'avatarPath': "cv/$email/$fileName",
      //   'avatarUrl': getDownloadUrl
      // });

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("File Selected")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("No file selected!")));
    }
  }

  uploadCV() async {
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.any);
    if (result != null) {
      final path = result.files.single.path!;
      final fileName = result.files.single.name;

      FirebaseStorage storage = FirebaseStorage.instance;
      await storage.ref('users/$email/cv/$fileName').putFile(File(path));
      String getDownloadUrl =
          await storage.ref('users/$email/cv/$fileName').getDownloadURL();
      // print("DOWNLOAD CV = $getDownloadUrl");
      setState(() {
        cvName = fileName;
        cvURL = getDownloadUrl;
      });
      // var user = FirebaseAuth.instance.currentUser;
      // CollectionReference ref = FirebaseFirestore.instance.collection('users');
      // ref.doc(user!.email).update({
      //   'cvName': cvName,
      //   'cvPath': "cv/$email/$fileName",
      //   'cvURL': getDownloadUrl
      // });

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("File Selected")));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("No file selected!")));
    }
  }

  uploadKTP() async {
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.any);
    if (result != null) {
      final path = result.files.single.path!;
      final fileName = result.files.single.name;

      FirebaseStorage storage = FirebaseStorage.instance;
      await storage.ref('users/$email/ktp/$fileName').putFile(File(path));
      String getDownloadUrl =
          await storage.ref('users/$email/ktp/$fileName').getDownloadURL();
      setState(() {
        ktpName = fileName;
        ktpURL = getDownloadUrl;
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("File Selected")));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("No file selected!")));
    }
  }

  uploadIjazah() async {
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.any);
    if (result != null) {
      final path = result.files.single.path!;
      final fileName = result.files.single.name;

      FirebaseStorage storage = FirebaseStorage.instance;
      await storage.ref('users/$email/ijazah/$fileName').putFile(File(path));
      String getDownloadUrl =
          await storage.ref('users/$email/ijazah/$fileName').getDownloadURL();
      setState(() {
        ijazahName = fileName;
        ijazahURL = getDownloadUrl;
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("File Selected")));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("No file selected!")));
    }
  }

  uploadTOEFL() async {
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.any);
    if (result != null) {
      final path = result.files.single.path!;
      final fileName = result.files.single.name;

      FirebaseStorage storage = FirebaseStorage.instance;
      await storage.ref('users/$email/toefl/$fileName').putFile(File(path));
      String getDownloadUrl =
          await storage.ref('users/$email/toefl/$fileName').getDownloadURL();
      setState(() {
        toeflName = fileName;
        toeflURL = getDownloadUrl;
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("File Selected")));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("No file selected!")));
    }
  }

  uploadTransNilai() async {
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.any);
    if (result != null) {
      final path = result.files.single.path!;
      final fileName = result.files.single.name;

      FirebaseStorage storage = FirebaseStorage.instance;
      await storage
          .ref('users/$email/transnilai/$fileName')
          .putFile(File(path));
      String getDownloadUrl = await storage
          .ref('users/$email/transnilai/$fileName')
          .getDownloadURL();
      setState(() {
        transNilaiName = fileName;
        transNilaiURL = getDownloadUrl;
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("File Selected")));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("No file selected!")));
    }
  }

  uploadAllFile() {
    var user = FirebaseAuth.instance.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.email).update({
      'about': biography,
      'avatarName': avatarName,
      'avatarUrl': avatarUrl,
      'cvName': cvName,
      'cvURL': cvURL,
      'ktpName': ktpName,
      'ktpURL': ktpURL,
      'ijazahName': ijazahName,
      'ijazahURL': ijazahURL,
      'toeflName': toeflName,
      'toeflURL': toeflURL,
      'transNilaiName': transNilaiName,
      'transNilaiURL': transNilaiURL,
    });
  }
}
