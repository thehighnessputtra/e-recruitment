import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latihan_firebase/pages/login_regist/login_page.dart';
import 'package:latihan_firebase/services/firebase_storage_services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List docsID = [];

  String hintTextCV = "CV Name";
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  String? name;
  String? email;
  String? role;
  String? cvName;

  Future getDocID() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
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

  @override
  void initState() {
    getDocID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(
            height: 60.0,
          ),
          Center(
            child: Stack(
              children: [
                ClipOval(
                    child: Material(
                        child: Ink.image(
                  image: const AssetImage("assets/images/admin.jpeg"),
                  fit: BoxFit.cover,
                  width: 120,
                  height: 120,
                ))),
                Positioned(
                    bottom: 0,
                    right: 4,
                    child: InkWell(
                      onTap: () async {
                        uploadCV();
                      },
                      child: ClipOval(
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.blue,
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
              "$name ($role)",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
            height: 10.0,
          ),
          Center(
            child: ElevatedButton(
                style: ButtonStyle(
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)))),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                },
                child: const Text("Logout")),
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 17, height: 1.3),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  readOnly: true,
                  onTap: () async {
                    uploadCV();
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    // labelText: "CV",
                    hintText: hintTextCV,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                // const SizedBox(
                //   height: 10.0,
                // ),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.green),
                          elevation: const MaterialStatePropertyAll(0),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)))),
                      onPressed: () {
                        // _uploadCV();
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text("Coming soon")));
                      },
                      child: const Text(
                        "Download CV",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  uploadCV() async {
    final Storage storage = Storage();
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.any);
    if (result == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("No file selected")));
    }
    final path = result!.files.single.path!;
    final fileName = result.files.single.name;
    print(path);
    print(fileName);
    setState(() {
      hintTextCV = fileName;
    });
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = FirebaseAuth.instance.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref
        .doc(user!.uid)
        .update({'cvName': hintTextCV, 'cvPath': "files/$fileName"});

    storage.uploadFile(path, fileName).then((value) => print("done"));
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Upload Sukses")));
  }
}
