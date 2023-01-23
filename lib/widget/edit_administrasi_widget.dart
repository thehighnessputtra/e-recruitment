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
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextFormField(
          readOnly: true,
          onTap: onPress,
          decoration: InputDecoration(
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
