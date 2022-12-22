import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/pages/navbar/navbottom_bar.dart';
import 'package:latihan_firebase/widget/dialog_widget.dart';
import 'package:latihan_firebase/widget/transition_widget.dart';
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
                    const Text(
                      "Biography",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: aboutController,
                      decoration: InputDecoration(
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
                      onTap: () {
                        uploadCV();
                      },
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
                              setState(() {
                                biography = aboutController.text;
                              });
                              dialogValidasi(context, "Are you sure?", () {
                                Navigator.pop(context);
                                uploadAllFile();

                                dialogInfo(
                                    context, "Success change profiles!", 2);
                                Future.delayed(const Duration(seconds: 3), () {
                                  Navigator.pop(context);
                                });
                              });
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
      print("DOWNLOAD AVATAR = $getDownloadUrl");
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
      await storage.ref('cv/$email/$fileName').putFile(File(path));
      String getDownloadUrl =
          await storage.ref('cv/$email/$fileName').getDownloadURL();
      print("DOWNLOAD CV = $getDownloadUrl");
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

  uploadAllFile() {
    var user = FirebaseAuth.instance.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.email).update({
      'avatarName': avatarName,
      'avatarPath': "cv/$email/$avatarName",
      'avatarUrl': avatarUrl,
      'cvName': cvName,
      'cvPath': "cv/$email/$cvName",
      'about': biography,
      'cvURL': cvURL
    });
  }
}
