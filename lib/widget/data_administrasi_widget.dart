import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';

class DataAdministrasi extends StatelessWidget {
  const DataAdministrasi(
      {super.key,
      required this.namaAdminstrasi,
      this.onTap,
      required this.fileAdministrasi});

  final String namaAdminstrasi;
  final String fileAdministrasi;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(namaAdminstrasi,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        TextFormField(
          readOnly: true,
          onTap: onTap,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: colorBlueSecondKAI)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: colorBlueSecondKAI)),
            hintText: fileAdministrasi,
          ),
        ),
        const SizedBox(
          height: 3.0,
        ),
      ],
    );
  }
}
