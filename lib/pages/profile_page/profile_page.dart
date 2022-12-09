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
  String? cvURL;
  String? about;
  String? avatarUrl;
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
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
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
                      image: NetworkImage("$avatarUrl"),
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
                  "$email",
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfile(),
                          ));
                    },
                    child: const Text("Edit Profile")),
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
                    Text(
                      "$about",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 17, height: 1.3),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text("Curriculum Vitae",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    TextFormField(
                      readOnly: true,
                      onTap: () {},
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: Colors.lightBlue.shade100)),
                        hintText: cvName,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
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
