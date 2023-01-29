import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';

class DataAdministrasi extends StatelessWidget {
  const DataAdministrasi(
      {super.key,
      required this.namaAdminstrasi,
      required this.fileAdministrasi});

  final String namaAdminstrasi;
  final String fileAdministrasi;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(namaAdminstrasi,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: colorBlueSecondKAI)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: colorBlueSecondKAI)),
            hintText: fileAdministrasi,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
