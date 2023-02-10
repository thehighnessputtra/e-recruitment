import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';
import 'package:latihan_firebase/widget/data_administrasi_widget.dart';
import 'package:latihan_firebase/widget/dialog_widget.dart';
import 'package:latihan_firebase/widget/transition_widget.dart';

class MedicalCheckupPage extends StatefulWidget {
  const MedicalCheckupPage({
    super.key,
    required this.namaFormasi,
    required this.pendidikan,
    required this.email,
  });

  final String namaFormasi;
  final String pendidikan;
  final String email;

  @override
  State<MedicalCheckupPage> createState() => _MedicalCheckupPageState();
}

class _MedicalCheckupPageState extends State<MedicalCheckupPage> {
  String? medicalName;
  String? medicalURL;
  UploadTask? uploadTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medical checkup"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.email),
              Text(widget.pendidikan),
              Text(widget.namaFormasi),
              Text(
                "Mohon lampirkan hasil Medical check-up di bawah!",
                style: size20,
              ),
              Text(
                "Pastikan file sudah terupload!",
                style: size16.copyWith(fontWeight: fw800),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    uploadMedicalCheckup();
                  },
                  child: const Text("Upload File")),
              ElevatedButton(
                  onPressed: () {
                    if (medicalName == null) {
                      dialogInfo(context, "File kosong!", 3);
                    } else {
                      CollectionReference ref =
                          FirebaseFirestore.instance.collection('listApplyKAI');
                      ref
                          .doc(widget.namaFormasi +
                              widget.pendidikan +
                              widget.email)
                          .update({
                        'medicalcheckupName': medicalName,
                        'medicalcheckupURL': medicalURL
                      });
                      navBackTransition(context);
                      navBackTransition(context);
                    }
                  },
                  child: const Text("Save File"))
            ],
          ),
        ),
      ),
    );
  }

  uploadMedicalCheckup() async {
    dialogInfo(context, "Mohon menunggu proses upload", 4);
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.any);
    if (result != null) {
      final path = result.files.single.path!;
      final fileName = result.files.single.name;
      FirebaseStorage storage = FirebaseStorage.instance;
      await storage
          .ref('users/${widget.email}/medicalcheckup/$fileName')
          .putFile(File(path));
      String getDownloadUrl = await storage
          .ref('users/${widget.email}/medicalcheckup/$fileName')
          .getDownloadURL();
      setState(() {
        medicalName = fileName;
        medicalURL = getDownloadUrl;
      });
      // ignore: use_build_context_synchronously
      dialogInfo(context, "File sukses diupload!", 1);
    } else {
      // ignore: use_build_context_synchronously
      dialogInfo(context, "File gagal diupload!", 1);
    }
  }
}
