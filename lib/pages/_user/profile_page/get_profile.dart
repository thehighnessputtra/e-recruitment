import 'dart:io' as io;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latihan_firebase/services/firebase_storage_services.dart';

import '../../login_regist/login_page.dart';
import 'edit_profile_page.dart';

class GetProfileDetail extends StatefulWidget {
  final String docsID;
  const GetProfileDetail({Key? key, required this.docsID}) : super(key: key);

  @override
  State<GetProfileDetail> createState() => _GetProfileDetailState();
}

class _GetProfileDetailState extends State<GetProfileDetail> {
  final TextEditingController filepickerCV = TextEditingController();
  String hintTextCV = "Please input ur CV";
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.docsID).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
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
                            final result = await FilePicker.platform.pickFiles(
                                allowMultiple: false, type: FileType.image);
                            if (result == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("No file selected")));
                            }

                            final path = result!.files.single.path!;
                            final fileName = result.files.single.name;
                            print(path);
                            print(fileName);
                            setState(() {
                              hintTextCV = fileName;
                            });
                            storage
                                .uploadImage(path, fileName)
                                .then((value) => print("done"));
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Upload Sukses")));
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
                  "${data['name']} (${data['role']})",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Center(
                child: Text(
                  data['email'],
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      controller: filepickerCV,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "CV",
                        hintText: hintTextCV,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.green),
                              elevation: const MaterialStatePropertyAll(0),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25)))),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Coming soon")));
                          },
                          child: const Text(
                            "Download CV",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.red),
                              elevation: const MaterialStatePropertyAll(0),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25)))),
                          onPressed: () async {
                            final result = await FilePicker.platform.pickFiles(
                                allowMultiple: false, type: FileType.any);
                            if (result == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("No file selected")));
                            }

                            final path = result!.files.single.path!;
                            final fileName = result.files.single.name;
                            print(path);
                            print(fileName);
                            setState(() {
                              hintTextCV = fileName;
                            });
                            storage
                                .uploadFile(path, fileName)
                                .then((value) => print("done"));
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Upload Sukses")));
                          },
                          child: const Text(
                            "Upload CV",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          );
          // Text(data['name'] + data['role']);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Container();
      },
    );
  }

  Future<UploadTask?> uploadFile(XFile? file) async {
    if (file == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No file was selected'),
        ),
      );

      return null;
    }

    UploadTask uploadTask;

    // Create a Reference to the file
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('flutter-tests')
        .child('/some-image.jpg');

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': file.path},
    );

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(file.path), metadata);
    }

    return Future.value(uploadTask);
  }
}
