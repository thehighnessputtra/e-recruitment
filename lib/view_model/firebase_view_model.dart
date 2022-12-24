import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseViewModel extends ChangeNotifier {
  String? downloadUrl;
  String? get getDownloadUrl => downloadUrl;

  postJobKAIToFirestore(
      String namaFormasi,
      String jenisKelamin,
      String pendidikan,
      String jurusan,
      String keterangan,
      String syaratDokumen,
      String kriteriaUmum,
      String ketentuanUmum,
      String tahapanSeleksi,
      String persyaratanUmum,
      String prosedurSeleksi,
      String lokasi,
      String urlPict) async {
    var user = FirebaseAuth.instance.currentUser;
    CollectionReference ref =
        FirebaseFirestore.instance.collection('listJobKAI');
    ref
        .doc(DateTime.now().millisecondsSinceEpoch.toString() + namaFormasi)
        .set({
      'formasi': namaFormasi,
      'jenisKelamin': jenisKelamin,
      'pendidikan': pendidikan,
      'jurusan': jurusan,
      'keterangan': keterangan,
      'syaratDokumen': syaratDokumen,
      'kriteriaUmum': kriteriaUmum,
      'ketentuanUmum': ketentuanUmum,
      'tahapanSeleksi': tahapanSeleksi,
      'persyaratanUmum': persyaratanUmum,
      'prosedurSeleksi': prosedurSeleksi,
      'lokasi': lokasi,
      'urlPict': urlPict,
      'createAt': DateTime.now().millisecondsSinceEpoch,
    });
  }
}
