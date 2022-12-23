import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';
import 'package:latihan_firebase/widget/custom_dropdown_field.dart';
import 'package:latihan_firebase/widget/custom_text_field.dart';

class CreateJobKAI extends StatefulWidget {
  const CreateJobKAI({super.key});

  @override
  State<CreateJobKAI> createState() => _CreateJobKAIState();
}

List jenisKelamin = ['Pria', 'Wanita', 'Pria & Wanita'];

class _CreateJobKAIState extends State<CreateJobKAI> {
  TextEditingController controllerFormasi = TextEditingController();
  TextEditingController controllerPendidikan = TextEditingController();
  TextEditingController controllerJurusan = TextEditingController();
  TextEditingController controllerKeterangan = TextEditingController();
  TextEditingController controllerSyaratDokumen = TextEditingController();
  TextEditingController controllerKriteriaUmum = TextEditingController();
  TextEditingController controllerKetentuanKhusus = TextEditingController();
  TextEditingController controllerPersyaratanUmum = TextEditingController();
  TextEditingController controllerTahapanSeleksi = TextEditingController();
  TextEditingController controllerProsedurSeleksi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Lowongan"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomTextField(
              controllerName: controllerFormasi,
              hintText: "Formasi",
              maxLine: 1,
            ),
            CustomDropdownField(listItem: jenisKelamin, hint: "Jenis kelamin"),
            CustomTextField(
              controllerName: controllerPendidikan,
              hintText: "Penididikan",
              maxLine: 1,
            ),
            CustomTextField(
              controllerName: controllerJurusan,
              hintText: "Jurusan",
              maxLine: 2,
            ),
            CustomTextField(
              controllerName: controllerKeterangan,
              hintText: "Keterangan",
              maxLine: 3,
            ),
            CustomTextField(
              controllerName: controllerSyaratDokumen,
              hintText: "Syarat Dokumen",
              maxLine: 4,
            ),
            CustomTextField(
              controllerName: controllerKriteriaUmum,
              hintText: "Kriteria Umum Pelamar",
              maxLine: 4,
            ),
            CustomTextField(
              controllerName: controllerKetentuanKhusus,
              hintText: "Ketentuan Khusus Pelamar",
              maxLine: 4,
            ),
            CustomTextField(
              controllerName: controllerPersyaratanUmum,
              hintText: "Persyaratan Umum Pelamar",
              maxLine: 4,
            ),
            CustomTextField(
              controllerName: controllerTahapanSeleksi,
              hintText: "Tahapan Seleksi",
              maxLine: 4,
            ),
            CustomTextField(
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
                    showDialog<void>(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Info'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                Text(controllerFormasi.text),
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
                                Navigator.pop(context);
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Text(
                                "OK",
                                style:
                                    size14.copyWith(color: colorBlueSecondKAI),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorBlueSecondKAI,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                FocusManager.instance.primaryFocus?.unfocus();
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
                  },
                  child: Text(
                    "POST",
                    style: size16.copyWith(color: colorWhiteKAI),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
