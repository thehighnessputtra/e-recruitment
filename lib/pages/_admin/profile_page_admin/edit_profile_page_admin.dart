import 'package:flutter/material.dart';

class EditProfileAdmin extends StatefulWidget {
  const EditProfileAdmin({super.key});

  @override
  State<EditProfileAdmin> createState() => _EditProfileAdminState();
}

class _EditProfileAdminState extends State<EditProfileAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Coming soon!",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Text(
            "About",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "Hasil dari about",
            ),
          )
        ],
      ),
    );
  }
}
