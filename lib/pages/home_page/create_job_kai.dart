import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/models/job_profile_model.dart';
import 'package:latihan_firebase/services/firebase_service.dart';
import 'package:latihan_firebase/utils/constant.dart';
import 'package:latihan_firebase/view_model/firebase_view_model.dart';
import 'package:latihan_firebase/widget/custom_dropdown_field.dart';
import 'package:latihan_firebase/widget/custom_text_field.dart';
import 'package:provider/provider.dart';

class CreateJobKAI extends StatefulWidget {
  const CreateJobKAI({super.key});

  @override
  State<CreateJobKAI> createState() => _CreateJobKAIState();
}

List jenisKelamin = ['Pria', 'Wanita', 'Pria & Wanita'];
String jenisKelaminValue = "Jenis Kelamin";

class _CreateJobKAIState extends State<CreateJobKAI> {
  TextEditingController controllerUrlPict = TextEditingController();
  TextEditingController controllerFormasi = TextEditingController();
  TextEditingController controllerLokasi = TextEditingController();
  TextEditingController controllerPendidikan = TextEditingController();
  TextEditingController controllerJurusan = TextEditingController();
  TextEditingController controllerKeterangan = TextEditingController();
  TextEditingController controllerSyaratDokumen = TextEditingController();
  TextEditingController controllerKriteriaUmum = TextEditingController();
  TextEditingController controllerKetentuanKhusus = TextEditingController();
  TextEditingController controllerPersyaratanUmum = TextEditingController();
  TextEditingController controllerTahapanSeleksi = TextEditingController();
  TextEditingController controllerProsedurSeleksi = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final firebaseProvider = context.read<FirebaseViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Lowongan"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                isReadOnly: false,
                controllerName: controllerUrlPict,
                hintText: "Upload Logo",
                maxLine: 1,
              ),
              CustomTextField(
                isReadOnly: false,
                controllerName: controllerFormasi,
                hintText: "Formasi",
                maxLine: 1,
              ),
              CustomTextField(
                isReadOnly: false,
                controllerName: controllerLokasi,
                hintText: "Lokasi",
                maxLine: 1,
              ),
              CustomDropdownField(
                  hint: jenisKelaminValue,
                  onChanged: (value) {
                    setState(() {
                      jenisKelaminValue = value;
                    });
                  },
                  listItem: jenisKelamin),
              CustomTextField(
                isReadOnly: false,
                controllerName: controllerPendidikan,
                hintText: "Penididikan",
                maxLine: 1,
              ),
              CustomTextField(
                isReadOnly: false,
                controllerName: controllerJurusan,
                hintText: "Jurusan",
                maxLine: 2,
              ),
              CustomTextField(
                isReadOnly: false,
                controllerName: controllerKeterangan,
                hintText: "Keterangan",
                maxLine: 3,
              ),
              CustomTextField(
                isReadOnly: false,
                controllerName: controllerSyaratDokumen,
                hintText: "Syarat Dokumen",
                maxLine: 4,
              ),
              CustomTextField(
                isReadOnly: false,
                controllerName: controllerKriteriaUmum,
                hintText: "Kriteria Umum Pelamar",
                maxLine: 4,
              ),
              CustomTextField(
                isReadOnly: false,
                controllerName: controllerKetentuanKhusus,
                hintText: "Ketentuan Khusus Pelamar",
                maxLine: 4,
              ),
              CustomTextField(
                isReadOnly: false,
                controllerName: controllerPersyaratanUmum,
                hintText: "Persyaratan Umum Pelamar",
                maxLine: 4,
              ),
              CustomTextField(
                isReadOnly: false,
                controllerName: controllerTahapanSeleksi,
                hintText: "Tahapan Seleksi",
                maxLine: 4,
              ),
              CustomTextField(
                isReadOnly: false,
                controllerName: controllerProsedurSeleksi,
                hintText: "Prosedur Seleksi",
                maxLine: 5,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0, backgroundColor: colorBlueSecondKAI),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Info'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    Text(jenisKelaminValue),
                                    Text(controllerUrlPict.text),
                                    Text(controllerFormasi.text),
                                    Text(controllerLokasi.text),
                                    Text(controllerPendidikan.text),
                                    Text(controllerJurusan.text),
                                    Text(controllerKeterangan.text),
                                    Text(controllerSyaratDokumen.text),
                                    Text(controllerKriteriaUmum.text),
                                    Text(controllerKetentuanKhusus.text),
                                    Text(controllerPersyaratanUmum.text),
                                    Text(controllerTahapanSeleksi.text),
                                    Text(controllerProsedurSeleksi.text),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    firebaseProvider.postJobKAIToFirestore(
                                        controllerFormasi.text,
                                        jenisKelaminValue,
                                        controllerPendidikan.text,
                                        controllerJurusan.text,
                                        controllerKeterangan.text,
                                        controllerSyaratDokumen.text,
                                        controllerKriteriaUmum.text,
                                        controllerKetentuanKhusus.text,
                                        controllerTahapanSeleksi.text,
                                        controllerPersyaratanUmum.text,
                                        controllerProsedurSeleksi.text,
                                        controllerLokasi.text,
                                        controllerUrlPict.text);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "OK",
                                    style: size14.copyWith(
                                        color: colorBlueSecondKAI),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: colorBlueSecondKAI,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: Text(
                                    "Batal",
                                    style: size14.copyWith(color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      "POST",
                      style: size16.copyWith(color: colorWhiteKAI),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  uploadLogoJob() async {
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (result != null) {
      final path = result.files.single.path!;
      final fileName = result.files.single.name;
      FirebaseStorage storage = FirebaseStorage.instance;
      await storage.ref('job/$fileName').putFile(File(path));
      String getDownloadUrl =
          await storage.ref('job/$fileName').getDownloadURL();
      print("DOWNLOAD AVATAR = $getDownloadUrl");
      setState(() {
        controllerUrlPict.text = getDownloadUrl;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("File Selected")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("No file selected!")));
    }
  }
}
