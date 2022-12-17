import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/pages/job_page/create_loker.dart';
import 'package:latihan_firebase/pages/login_regist/login_page.dart';
import 'package:latihan_firebase/pages/profile_page/edit_profile_page.dart';
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
                  dialogValidasi(
                    context,
                    "Are you sure?",
                    () {
                      FirebaseAuth.instance.signOut();
                      navReplaceTransition(context, const LoginPage());
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
                child: ElevatedButton(
                    onPressed: () {
                      navPushTransition(context, const EditProfile());
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
                      "Biography",
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
              ElevatedButton(
                  onPressed: () {
                    addJob();
                  },
                  child: const Text("Create Lowongan Kerja")),
              ElevatedButton(
                  onPressed: () {
                    uploadImage();
                  },
                  child: const Text("Upload Image"))
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
          navPushTransition(context, const CreateLoker());
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  uploadImage() async {
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);
    if (result != null) {
      final path = result.files.single.path!;
      final fileName = result.files.single.name;

      FirebaseStorage storage = FirebaseStorage.instance;
      await storage.ref('img/$fileName').putFile(File(path));
      String getDownloadUrl =
          await storage.ref('img/$fileName').getDownloadURL();
      print("DOWNLOAD AVATAR = $getDownloadUrl");
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
}
