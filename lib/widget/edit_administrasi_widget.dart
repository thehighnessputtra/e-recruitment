import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';

class EditAdministrasiWidget extends StatelessWidget {
  const EditAdministrasiWidget(
      {super.key,
      required this.namaAdministrasi,
      required this.fileAdministrasi,
      required this.onPress});

  final String namaAdministrasi;
  final String fileAdministrasi;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(namaAdministrasi,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        TextFormField(
          onTap: onPress,
          readOnly: true,
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
