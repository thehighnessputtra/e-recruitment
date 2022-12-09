import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

class CreateLoker extends StatefulWidget {
  const CreateLoker({Key? key}) : super(key: key);

  @override
  State<CreateLoker> createState() => _CreateLokerState();
}

class _CreateLokerState extends State<CreateLoker> {
  final controllerNamaLoker = TextEditingController();
  final controllerNamaPerusahaan = TextEditingController();
  final controllerTipePekerjaan = TextEditingController();
  final controllerLokasi = TextEditingController();
  final controllerGaji = TextEditingController();
  final controllerLogo = TextEditingController();
  final controllerDeskripsiKualifikasi = TextEditingController();
  final controllerDeskripsiKeahlian = TextEditingController();
  final controllerDeskripsiPerusahaan = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Loker"),
          actions: const [],
        ),
        body: Form(
            child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              TextFormField(
                controller: controllerNamaLoker,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Judul Lowongan",
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 18),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: controllerNamaPerusahaan,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Nama Perusahaan",
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 18),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: controllerLokasi,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Lokasi Perusahaan",
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 18),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: controllerTipePekerjaan,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Tipe Pekerjaan",
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 18),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: controllerGaji,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Gaji",
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 18),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: controllerLogo,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "URL Logo Perusahaan",
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 18),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                maxLines: 4,
                controller: controllerDeskripsiPerusahaan,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Deskripsi Perusahaan",
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 18),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                maxLines: 4,
                controller: controllerDeskripsiKualifikasi,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Deskripsi Kualifikasi",
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 18),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                maxLines: 4,
                controller: controllerDeskripsiKeahlian,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Deskripsi Keahlian",
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 18),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .runTransaction((transaction) async {
                      CollectionReference reference =
                          FirebaseFirestore.instance.collection("listLoker");
                      await reference
                          .doc(controllerNamaLoker.text +
                              DateTime.now().millisecondsSinceEpoch.toString())
                          .set({
                        "namaLoker": controllerNamaLoker.text,
                        "namaPerusahaan": controllerNamaPerusahaan.text,
                        "tipePekerjaan": controllerTipePekerjaan.text,
                        "lokasi": controllerLokasi.text,
                        "gaji": controllerGaji.text,
                        "urlLogo": controllerLogo.text,
                        "deskripsiPerusahaan":
                            controllerDeskripsiPerusahaan.text,
                        "deskripsiKeahlian": controllerDeskripsiKeahlian.text,
                        "deskripsiKualifikasi":
                            controllerDeskripsiKualifikasi.text,
                        "createTime": DateTime.now().millisecondsSinceEpoch
                      });
                    });
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Berhasil Menambahkan Loker!")));
                    Navigator.pop(context);
                  },
                  child: const Text("Simpan")),
            ],
          ),
        )));
  }
}
