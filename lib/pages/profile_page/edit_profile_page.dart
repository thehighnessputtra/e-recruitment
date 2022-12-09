import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latihan_firebase/pages/login_regist/login_page.dart';
import 'package:latihan_firebase/pages/profile_page/edit_profile_page.dart';
import 'package:latihan_firebase/services/firebase_storage_services.dart';
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
  String? cvURL;
  String? about;
  String? avatarUrl;
  String? avatarName;
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
    final aboutController = TextEditingController();
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
                      image: NetworkImage("$avatarUrl"),
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
                  "$name",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Center(
                child: Text(
                  "${email}",
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
                    const Text(
                      "About",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: aboutController,
                      decoration: InputDecoration(
                        hintText: about,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: Colors.lightBlue.shade100)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: Colors.lightBlue.shade100)),
                      ),
                      maxLines: 5,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text("Curriculum Vitae",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: Colors.lightBlue.shade100)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: Colors.lightBlue.shade100)),
                        hintText: cvName,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              if (cvURL != null) {
                                final Uri _url = Uri.parse(cvURL!);
                                if (!await launchUrl(_url,
                                    mode: LaunchMode.externalApplication)) {
                                  throw "Could not launch $_url";
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Could not launch URL!")));
                              }
                            },
                            child: const Text(
                              "Download CV",
                            )),
                        ElevatedButton(
                            onPressed: () async {
                              uploadCV();
                            },
                            child: const Text(
                              "Upload CV",
                            )),
                        ElevatedButton(
                            onPressed: () {
                              FirebaseFirestore firebaseFirestore =
                                  FirebaseFirestore.instance;
                              var user = FirebaseAuth.instance.currentUser;
                              CollectionReference ref = FirebaseFirestore
                                  .instance
                                  .collection('users');
                              ref.doc(user!.email).update({
                                'about': aboutController.text,
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Save Changes!")));
                            },
                            child: const Text("Save Changes"))
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
      await storage.ref('avatar/$email/$fileName').putFile(File(path));
      String getDownloadUrl =
          await storage.ref('avatar/$email/$fileName').getDownloadURL();
      print("DOWNLOAD AVATAR = ${getDownloadUrl}");
      setState(() {
        avatarName = fileName;
        avatarUrl = getDownloadUrl;
      });
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      var user = FirebaseAuth.instance.currentUser;
      CollectionReference ref = FirebaseFirestore.instance.collection('users');
      ref.doc(user!.email).update({
        'avatarName': cvName,
        'avatarPath': "cv/$email/$fileName",
        'avatarUrl': getDownloadUrl
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Upload Sukses!")));
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
      await storage.ref('cv/$email/$fileName').putFile(File(path));
      String getDownloadUrl =
          await storage.ref('cv/$email/$fileName').getDownloadURL();
      print("DOWNLOAD CV = ${getDownloadUrl}");
      setState(() {
        cvName = fileName;
        cvURL = getDownloadUrl;
      });
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      var user = FirebaseAuth.instance.currentUser;
      CollectionReference ref = FirebaseFirestore.instance.collection('users');
      ref.doc(user!.email).update({
        'cvName': cvName,
        'cvPath': "cv/$email/$fileName",
        'cvURL': getDownloadUrl
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Upload Sukses!")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("No file selected!")));
    }
  }
}
