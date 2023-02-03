import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:latihan_firebase/widget/data_administrasi_widget.dart';

class MedicalCheckupPage extends StatefulWidget {
  const MedicalCheckupPage({super.key});

  @override
  State<MedicalCheckupPage> createState() => _MedicalCheckupPageState();
}

class _MedicalCheckupPageState extends State<MedicalCheckupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medical checkup"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Mohon lampirkan hasil Medical check-up di bawah!"),
            const SizedBox(
              height: 10.0,
            ),
            const DataAdministrasi(
              namaAdminstrasi: "Medical Checkup",
              fileAdministrasi: "nama_file",
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Upload File"))
          ],
        ),
      ),
    );
  }
}
